part of 'get_guild_bloc.dart';

@immutable
sealed class GetGuildState {}

final class GetGuildInitial extends GetGuildState {}

final class GetGuildLoading extends GetGuildState {}

final class GetGuildLoaded extends GetGuildState {
  final List<GuildModel> guildList;

  GetGuildLoaded({required this.guildList});
}

final class GetGuildError extends GetGuildState {
  final String message;

  GetGuildError({required this.message});
}
