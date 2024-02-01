part of 'get_guild_details_bloc.dart';

@immutable
sealed class GetGuildDetailsEvent {}

class GetGuildDetailsStartEvent extends GetGuildDetailsEvent {
  final int guildId;

  GetGuildDetailsStartEvent({required this.guildId});
}
