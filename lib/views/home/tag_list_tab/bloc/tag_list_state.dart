part of 'tag_list_bloc.dart';

@immutable
sealed class TagListState {}

final class TagListInitial extends TagListState {}

final class TagListLoading extends TagListState {}

final class TagListLoaded extends TagListState {
  final List<TagsModel> tagList;

  TagListLoaded(this.tagList);
}

final class TagListError extends TagListState {
  final String message;

  TagListError(this.message);
}
