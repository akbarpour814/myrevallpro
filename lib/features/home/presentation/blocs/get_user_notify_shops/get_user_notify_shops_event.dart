part of 'get_user_notify_shops_bloc.dart';

@immutable
sealed class GetUserNotifyShopsEvent {}

class GetUserNotifyShopsStartEvent extends GetUserNotifyShopsEvent {
  GetUserNotifyShopsStartEvent();
}
