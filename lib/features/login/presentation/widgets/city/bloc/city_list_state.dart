part of 'city_list_bloc.dart';

@immutable
abstract class CityListState {}

class CityListInitial extends CityListState {}

class CityListLoading extends CityListState {}

class CityListLoaded extends CityListState {
  final List<CityModel> cityList;

  CityListLoaded(this.cityList);
}

class CityListError extends CityListState {
  final String message;

  CityListError(this.message);
}
