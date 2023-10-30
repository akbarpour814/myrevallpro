part of 'add_new_bloc.dart';

@immutable
sealed class AddNewEvent {}

class AddNewTextRequestEvent extends AddNewEvent {
  final TextModel textModel;
  final String tags;
  final bool goDelete;

  AddNewTextRequestEvent(
      {required this.textModel, required this.tags, this.goDelete = false});
}
