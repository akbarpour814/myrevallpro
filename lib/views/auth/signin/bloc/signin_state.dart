part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserCredential userCredential;

  SigninSuccess(this.userCredential);
}

final class SigninError extends SigninState {
  final String message;

  SigninError(this.message);
}
