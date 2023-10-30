part of 'hashtag_auto_complate_bloc.dart';

@immutable
sealed class HashtagAutoComplateEvent {}

class HashtagAutoComplateLoadEvent extends HashtagAutoComplateEvent {
  final String userId;

  HashtagAutoComplateLoadEvent(this.userId);
}
