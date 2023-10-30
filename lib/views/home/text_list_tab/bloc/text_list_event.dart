part of 'text_list_bloc.dart';

@immutable
sealed class TextListEvent {}

class TextListLoadEvent extends TextListEvent {}

class TextListClearEvent extends TextListEvent {}
