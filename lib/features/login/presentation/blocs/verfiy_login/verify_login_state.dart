part of 'verify_login_bloc.dart';

@immutable
sealed class VerifyLoginState {}

final class VerifyLoginInitial extends VerifyLoginState {}

final class VerifyLoginLoading extends VerifyLoginState {}

final class VerifyLoginSuccess extends VerifyLoginState {
  final String token;

  VerifyLoginSuccess({required this.token});
}

final class VerifyLoginError extends VerifyLoginState {
  final String message;

  VerifyLoginError({required this.message});
}
