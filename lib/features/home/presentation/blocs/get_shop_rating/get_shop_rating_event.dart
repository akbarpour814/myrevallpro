part of 'get_shop_rating_bloc.dart';

@immutable
sealed class GetShopRatingEvent {}

class GetShopRatingStartEvent extends GetShopRatingEvent {
  final int shopId;

  GetShopRatingStartEvent({required this.shopId});
}
