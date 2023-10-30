part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserCredential userCredential;

  RegisterSuccess(this.userCredential);
}

final class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}
