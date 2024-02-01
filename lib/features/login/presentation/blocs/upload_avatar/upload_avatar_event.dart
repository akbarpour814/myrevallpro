part of 'upload_avatar_bloc.dart';

@immutable
sealed class UploadAvatarEvent {}

class UploadAvatarStartEvent extends UploadAvatarEvent {
  final File file;

  UploadAvatarStartEvent({required this.file});
}
