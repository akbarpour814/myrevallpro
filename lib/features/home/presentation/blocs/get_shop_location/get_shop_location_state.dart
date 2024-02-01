part of 'get_shop_location_bloc.dart';

@immutable
sealed class GetShopLocationState {}

final class GetShopLocationInitial extends GetShopLocationState {}

final class GetShopLocationLoading extends GetShopLocationState {}

final class GetShopLocationLoaded extends GetShopLocationState {
  final ShopModel shopModel;

  GetShopLocationLoaded({required this.shopModel});
}

final class GetShopLocationError extends GetShopLocationState {
  final String message;

  GetShopLocationError({required this.message});
}
