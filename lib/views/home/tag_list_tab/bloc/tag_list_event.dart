part of 'tag_list_bloc.dart';

@immutable
sealed class TagListEvent {}

class TagListLoadEvent extends TagListEvent {}

class TagListClearEvent extends TagListEvent {}