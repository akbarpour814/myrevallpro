part of 'add_comment_bloc.dart';

@immutable
sealed class AddCommentEvent {}

class AddCommentRequestEvent extends AddCommentEvent {
  final CommentRequestModel requestModel;

  AddCommentRequestEvent({required this.requestModel});
}
