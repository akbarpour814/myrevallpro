part of 'get_app_config_bloc.dart';

@immutable
sealed class GetAppConfigState {}

final class GetAppConfigInitial extends GetAppConfigState {}

final class GetAppConfigLoading extends GetAppConfigState {}

final class GetAppConfigLoaded extends GetAppConfigState {
  final AppConfigModel configModel;

  GetAppConfigLoaded({required this.configModel});
}

final class GetAppConfigError extends GetAppConfigState {
  final String message;

  GetAppConfigError({required this.message});
}
