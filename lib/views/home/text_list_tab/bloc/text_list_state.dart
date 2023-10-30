part of 'text_list_bloc.dart';

@immutable
sealed class TextListState {}

final class TextListInitial extends TextListState {}

final class TextListLoading extends TextListState {}

final class TextListLoaded extends TextListState {
  final List<TextModel> textList;

  TextListLoaded(this.textList);
}

final class TextListError extends TextListState {
  final String message;

  TextListError(this.message);
}
