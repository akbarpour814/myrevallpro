part of 'hashtag_auto_complate_bloc.dart';

@immutable
sealed class HashtagAutoComplateState {}

final class HashtagAutoComplateInitial extends HashtagAutoComplateState {}

final class HashtagAutoComplateLoading extends HashtagAutoComplateState {}

final class HashtagAutoComplateLoaded extends HashtagAutoComplateState {
  final List<TagsModel> tagList;

  HashtagAutoComplateLoaded(this.tagList);
}

final class HashtagAutoComplateError extends HashtagAutoComplateState {
  final String message;

  HashtagAutoComplateError(this.message);
}
