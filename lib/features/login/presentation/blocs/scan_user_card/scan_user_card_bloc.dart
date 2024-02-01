import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/domain/use_cases/scan_user_card_use_case.dart';
import 'package:meta/meta.dart';

part 'scan_user_card_event.dart';
part 'scan_user_card_state.dart';

class ScanUserCardBloc extends Bloc<ScanUserCardEvent, ScanUserCardState> {
  ScanUserCardBloc() : super(ScanUserCardInitial()) {
    on<ScanUserCardEvent>((event, emit) async {
      if (event is ScanUserCardStartEvent) {
        emit(ScanUserCardLoading());
        final state = await ScanUserCardUseCase().call(event.qr);
        if (state is DataSuccess) {
          emit(ScanUserCardSuccess());
        } else {
          emit(ScanUserCardError(message: state.error!));
        }
      }
    });
  }
}
