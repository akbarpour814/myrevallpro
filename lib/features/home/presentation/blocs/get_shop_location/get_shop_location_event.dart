part of 'get_shop_location_bloc.dart';

@immutable
sealed class GetShopLocationEvent {}

class GetShopLocationStartEvent extends GetShopLocationEvent {
  final int shopId;

  GetShopLocationStartEvent({required this.shopId});
}
