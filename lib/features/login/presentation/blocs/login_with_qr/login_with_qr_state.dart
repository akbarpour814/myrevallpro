part of 'login_with_qr_bloc.dart';

@immutable
sealed class LoginWithQrState {}

final class LoginWithQrInitial extends LoginWithQrState {}

final class LoginWithQrLoading extends LoginWithQrState {}

final class LoginWithQrSuccess extends LoginWithQrState {
  final LoginOrRegisterResponseModel resModel;

  LoginWithQrSuccess({required this.resModel});
}

final class LoginWithQrError extends LoginWithQrState {
  final String message;

  LoginWithQrError({required this.message});
}
