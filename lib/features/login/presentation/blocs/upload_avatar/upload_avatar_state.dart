part of 'upload_avatar_bloc.dart';

@immutable
sealed class UploadAvatarState {}

final class UploadAvatarInitial extends UploadAvatarState {}

final class UploadAvatarLoading extends UploadAvatarState {}

final class UploadAvatarSuccess extends UploadAvatarState {
  final String link;

  UploadAvatarSuccess({required this.link});
}

final class UploadAvatarError extends UploadAvatarState {}
