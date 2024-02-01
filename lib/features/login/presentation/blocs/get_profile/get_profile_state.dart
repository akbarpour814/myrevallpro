part of 'get_profile_bloc.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileLoaded extends GetProfileState {
  final UserModel user;
  final ShopDetailModel? shopModel;

  GetProfileLoaded({required this.user, this.shopModel});
}

final class GetProfileError extends GetProfileState {
  final String message;

  GetProfileError({required this.message});
}
