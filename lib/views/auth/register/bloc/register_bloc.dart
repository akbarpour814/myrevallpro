import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/model/auth/sign_request_model.dart';
import 'package:revallpro/data/repo/auth_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterRequestEvent) {
        try {
          emit(RegisterLoading());
          final res =
              await getIt<IAuthRepository>().register(event.requestModel);
          if (res.validate) {
            emit(RegisterSuccess(res!.data as UserCredential));
          } else {
            emit(RegisterError(res.getErrorMessage));
          }
        } catch (e) {
          emit(RegisterError(null.getErrorMessage));
        }
      }
    });
  }
}
