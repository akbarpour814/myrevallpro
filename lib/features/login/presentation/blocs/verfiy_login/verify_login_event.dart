part of 'verify_login_bloc.dart';

@immutable
sealed class VerifyLoginEvent {}

class VerifyLoginRequestEvent extends VerifyLoginEvent {
  final LoginWithQrRequestModel requestModel;

  VerifyLoginRequestEvent({required this.requestModel});
}

class VerifyRegisterRequestEvent extends VerifyLoginEvent {
  final LoginWithQrRequestModel requestModel;

  VerifyRegisterRequestEvent({required this.requestModel});
}
