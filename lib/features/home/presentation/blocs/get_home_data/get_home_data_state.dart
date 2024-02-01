part of 'get_home_data_bloc.dart';

@immutable
sealed class GetHomeDataState {}

final class GetHomeDataInitial extends GetHomeDataState {}

final class GetHomeDataLoading extends GetHomeDataState {}

final class GetHomeDataLoaded extends GetHomeDataState {
  final HomeDataModel homeDataModel;

  GetHomeDataLoaded({required this.homeDataModel});
}

final class GetHomeDataError extends GetHomeDataState {
  final String message;

  GetHomeDataError({required this.message});
}
