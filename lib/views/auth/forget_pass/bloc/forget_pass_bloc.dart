import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/repo/auth_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  ForgetPassBloc() : super(ForgetPassInitial()) {
    on<ForgetPassEvent>((event, emit) async {
      if (event is ForgetPassRequestEvent) {
        try {
          emit(ForgetPassLoading());
          final res = await getIt<IAuthRepository>().resetPass(event.email);
          if (res.validateWithoutData) {
            emit(ForgetPassSuccess());
          } else {
            emit(ForgetPassError(res.getErrorMessage));
          }
        } catch (e) {
          emit(ForgetPassError(null.getErrorMessage));
        }
      }
    });
  }
}
