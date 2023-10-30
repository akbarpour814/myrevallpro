import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/model/auth/sign_request_model.dart';
import 'package:revallpro/data/repo/auth_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/user_infos.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is SigninRequestEvent) {
        try {
          emit(SigninLoading());
          final res = await getIt<IAuthRepository>().signin(event.requestModel);
          if (res.validate) {
            await UserInfos.setEmail(event.requestModel.email);
            await UserInfos.setId((res!.data as UserCredential).user!.uid);
            await UserInfos.setIsRandomNotification(true);
            await UserInfos.setIsRepeatNotification(true);
            await UserInfos.setRandomNotificationCount(5);
            await UserInfos.setBool('newLogin', true);
            emit(SigninSuccess(res.data as UserCredential));
          } else {
            emit(SigninError(res.getErrorMessage));
          }
        } catch (e) {
          emit(SigninError(null.getErrorMessage));
        }
      }
    });
  }
}
