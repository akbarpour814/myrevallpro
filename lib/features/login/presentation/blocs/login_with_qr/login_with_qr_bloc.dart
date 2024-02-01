import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/data/models/login_or_register_response_model.dart';
import 'package:customer_club/features/login/domain/use_cases/login_with_qr_use_case.dart';
import 'package:meta/meta.dart';

part 'login_with_qr_event.dart';
part 'login_with_qr_state.dart';

class LoginWithQrBloc extends Bloc<LoginWithQrEvent, LoginWithQrState> {
  LoginWithQrBloc() : super(LoginWithQrInitial()) {
    on<LoginWithQrEvent>((event, emit) async {
      if (event is LoginWithQrRequestEvent) {
        emit(LoginWithQrLoading());
        final state = await LoginWithQRUseCase().call(event.qr);
        if (state is DataSuccess) {
          emit(LoginWithQrSuccess(resModel: state.data!));
        } else {
          emit(LoginWithQrError(message: state.error!));
        }
      }
    });
  }
}
