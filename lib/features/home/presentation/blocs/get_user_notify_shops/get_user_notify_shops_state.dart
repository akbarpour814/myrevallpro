part of 'get_user_notify_shops_bloc.dart';

@immutable
sealed class GetUserNotifyShopsState {}

final class GetUserNotifyShopsInitial extends GetUserNotifyShopsState {}

final class GetUserNotifyShopsLoading extends GetUserNotifyShopsState {}

final class GetUserNotifyShopsLoaded extends GetUserNotifyShopsState {
  final List<ShopModel> shopsList;

  GetUserNotifyShopsLoaded({required this.shopsList});
}

final class GetUserNotifyShopsError extends GetUserNotifyShopsState {
  final String message;

  GetUserNotifyShopsError({required this.message});
}
