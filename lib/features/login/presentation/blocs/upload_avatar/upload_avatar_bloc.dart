import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/domain/use_cases/upload_avatar_use_case.dart';
import 'package:meta/meta.dart';

part 'upload_avatar_event.dart';
part 'upload_avatar_state.dart';

class UploadAvatarBloc extends Bloc<UploadAvatarEvent, UploadAvatarState> {
  UploadAvatarBloc() : super(UploadAvatarInitial()) {
    on<UploadAvatarEvent>((event, emit) async {
      if (event is UploadAvatarStartEvent) {
        final state = await UploadAvatarUseCase().call(event.file);
        emit(UploadAvatarLoading());
        if (state is DataSuccess) {
          emit(UploadAvatarSuccess(link: state.data!));
        }
      }
    });
  }
}
