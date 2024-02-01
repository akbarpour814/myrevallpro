part of 'get_guild_details_bloc.dart';

@immutable
sealed class GetGuildDetailsState {}

final class GetGuildDetailsInitial extends GetGuildDetailsState {}

final class GetGuildDetailsLoading extends GetGuildDetailsState {}

final class GetGuildDetailsLoaded extends GetGuildDetailsState {
  final GuildDetailsModel guildDetailsModel;

  GetGuildDetailsLoaded({required this.guildDetailsModel});
}

final class GetGuildDetailsError extends GetGuildDetailsState {
  final String message;

  GetGuildDetailsError({required this.message});
}
