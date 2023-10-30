import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/repo/auth_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/local_notification_manager.dart';
import 'package:revallpro/utils/user_infos.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc() : super(SignOutInitial()) {
    on<SignOutEvent>((event, emit) async {
      if (event is SignOutRequestEvent) {
        try {
          emit(SignOutLoading());
          await UserInfos.clear();
          await getIt<IAuthRepository>().signOut();
          await localNotificationManager.cancelAll();
          emit(SignOutSuccess());
        } catch (e) {
          emit(SignOutError());
        }
      }
    });
  }
}
