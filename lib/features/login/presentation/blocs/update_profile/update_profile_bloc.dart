import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:customer_club/features/login/domain/use_cases/update_profile_use_case.dart';
import 'package:meta/meta.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      if (event is UpdateProfileRequestEvent) {
        emit(UpdateProfileLoading());
        final state = await UpdateProfileUseCase().call(event.userModel);
        if (state is DataSuccess) {
          emit(UpdateProfileSuccess());
        } else {
          emit(UpdateProfileError(message: state.error!));
        }
      }
    });
  }
}
