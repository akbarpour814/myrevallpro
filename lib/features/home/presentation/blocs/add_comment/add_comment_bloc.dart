import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/data/models/comment_request_model.dart';
import 'package:customer_club/features/home/domain/use_cases/add_comment_use_case.dart';
import 'package:meta/meta.dart';

part 'add_comment_event.dart';
part 'add_comment_state.dart';

class AddCommentBloc extends Bloc<AddCommentEvent, AddCommentState> {
  AddCommentBloc() : super(AddCommentInitial()) {
    on<AddCommentEvent>((event, emit) async {
      if (event is AddCommentRequestEvent) {
        emit(AddCommentLoading());
        final state = await AddCommentUseCase().call(event.requestModel);
        if (state is DataSuccess) {
          emit(AddCommentSuccess());
        } else {
          emit(AddCommentError(message: state.error!));
        }
      }
    });
  }
}
