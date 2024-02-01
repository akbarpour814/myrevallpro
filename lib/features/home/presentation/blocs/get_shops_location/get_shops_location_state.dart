part of 'get_shops_location_bloc.dart';

@immutable
sealed class GetShopsLocationState {}

final class GetShopsLocationInitial extends GetShopsLocationState {}

final class GetShopsLocationLoading extends GetShopsLocationState {}

final class GetShopsLocationLoaded extends GetShopsLocationState {
  final List<ShopModel> shopList;

  GetShopsLocationLoaded({required this.shopList});
}

final class GetShopsLocationError extends GetShopsLocationState {
  final String message;

  GetShopsLocationError({required this.message});
}
