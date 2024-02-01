part of 'get_all_city_bloc.dart';

@immutable
sealed class GetAllCityState {}

final class GetAllCityInitial extends GetAllCityState {}

final class GetAllCityLoading extends GetAllCityState {}

final class GetAllCityLoaded extends GetAllCityState {
  final List<CityModel> cityList;

  GetAllCityLoaded({required this.cityList});
}

final class GetAllCityError extends GetAllCityState {
  final String message;

  GetAllCityError({required this.message});
}
