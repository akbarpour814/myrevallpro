part of 'get_shop_details_bloc.dart';

@immutable
sealed class GetShopDetailsEvent {}

class GetShopDetailsStartEvent extends GetShopDetailsEvent {
  final int shopId;

  GetShopDetailsStartEvent({required this.shopId});
}
