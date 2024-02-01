part of 'get_guild_bloc.dart';

@immutable
sealed class GetGuildEvent {}

class GetGuildStartEvent extends GetGuildEvent {}
