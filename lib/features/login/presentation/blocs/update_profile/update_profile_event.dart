part of 'update_profile_bloc.dart';

@immutable
sealed class UpdateProfileEvent {}

class UpdateProfileRequestEvent extends UpdateProfileEvent {
  final UserModel userModel;

  UpdateProfileRequestEvent({required this.userModel});
}
