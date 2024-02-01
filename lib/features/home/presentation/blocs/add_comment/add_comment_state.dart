part of 'add_comment_bloc.dart';

@immutable
sealed class AddCommentState {}

final class AddCommentInitial extends AddCommentState {}

final class AddCommentLoading extends AddCommentState {}

final class AddCommentSuccess extends AddCommentState {}

final class AddCommentError extends AddCommentState {
  final String message;

  AddCommentError({required this.message});
}
