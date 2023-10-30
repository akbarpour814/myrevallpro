part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterRequestEvent extends RegisterEvent {
  final SignRequestModel requestModel;

  RegisterRequestEvent(this.requestModel);
}
