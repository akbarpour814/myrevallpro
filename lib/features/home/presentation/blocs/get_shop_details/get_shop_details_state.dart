part of 'get_shop_details_bloc.dart';

@immutable
sealed class GetShopDetailsState {}

final class GetShopDetailsInitial extends GetShopDetailsState {}

final class GetShopDetailsLoading extends GetShopDetailsState {}

final class GetShopDetailsLoaded extends GetShopDetailsState {
  final ShopAllDetailsModel shopAllDetailsModel;

  GetShopDetailsLoaded({required this.shopAllDetailsModel});
}

final class GetShopDetailsError extends GetShopDetailsState {
  final String message;

  GetShopDetailsError({required this.message});
}
