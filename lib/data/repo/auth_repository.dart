import 'package:injectable/injectable.dart';
import 'package:revallpro/data/model/auth/sign_request_model.dart';
import 'package:revallpro/data/model/base_response_model.dart';
import 'package:revallpro/data/source/auth_data_source.dart';
import 'package:revallpro/di/di.dart';

abstract class IAuthRepository {
  Future<BaseResponseModel?> register(SignRequestModel requestModel);
  Future<BaseResponseModel?> signin(SignRequestModel requestModel);
  Future<BaseResponseModel?> resetPass(String email);
  Future<BaseResponseModel?> signOut();
}

@Injectable(
  as: IAuthRepository,
)
class AuthRepository implements IAuthRepository {
  @override
  Future<BaseResponseModel?> register(SignRequestModel requestModel) =>
      getIt<IAuthDataSource>().register(requestModel);

  @override
  Future<BaseResponseModel?> signin(SignRequestModel requestModel) =>
      getIt<IAuthDataSource>().signin(requestModel);

  @override
  Future<BaseResponseModel?> resetPass(String email) =>
      getIt<IAuthDataSource>().resetPass(email);

  @override
  Future<BaseResponseModel?> signOut() => getIt<IAuthDataSource>().signOut();
}
