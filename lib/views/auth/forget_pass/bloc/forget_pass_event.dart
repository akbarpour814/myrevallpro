part of 'forget_pass_bloc.dart';

@immutable
sealed class ForgetPassEvent {}

class ForgetPassRequestEvent extends ForgetPassEvent {
  final String email;

  ForgetPassRequestEvent(this.email);
}
