part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class SigninRequestEvent extends SigninEvent {
  final SignRequestModel requestModel;

  SigninRequestEvent(this.requestModel);
}
