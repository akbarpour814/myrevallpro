import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:revallpro/data/model/auth/sign_request_model.dart';
import 'package:revallpro/data/model/base_response_model.dart';

abstract class IAuthDataSource {
  Future<BaseResponseModel?> register(SignRequestModel requestModel);
  Future<BaseResponseModel?> signin(SignRequestModel requestModel);
  Future<BaseResponseModel?> resetPass(String email);
  Future<BaseResponseModel?> signOut();
}

@Injectable(
  as: IAuthDataSource,
)
class AuthDataSource implements IAuthDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<BaseResponseModel?> register(SignRequestModel requestModel) async {
    try {
      return BaseResponseModel(
          isSuccess: true,
          data: (await auth.createUserWithEmailAndPassword(
              email: requestModel.email, password: requestModel.pass)));
    } on FirebaseAuthException catch (e) {
      return BaseResponseModel(isSuccess: false, message: e.message);
    }
  }

  @override
  Future<BaseResponseModel?> signin(SignRequestModel requestModel) async {
    try {
      return BaseResponseModel(
          isSuccess: true,
          data: (await auth.signInWithEmailAndPassword(
              email: requestModel.email, password: requestModel.pass)));
    } on FirebaseAuthException catch (e) {
      return BaseResponseModel(isSuccess: false, message: e.message);
    }
  }

  @override
  Future<BaseResponseModel?> resetPass(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return BaseResponseModel(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return BaseResponseModel(
          isSuccess: false, message: e.message?.split('.').first);
    }
  }

  @override
  Future<BaseResponseModel?> signOut() async {
    try {
      await auth.signOut();
      return BaseResponseModel(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return BaseResponseModel(
          isSuccess: false, message: e.message?.split('.').first);
    }
  }
}
