import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/domain/use_cases/get_user_notify_shops_use_case.dart';
import 'package:meta/meta.dart';

part 'get_user_notify_shops_event.dart';
part 'get_user_notify_shops_state.dart';

class GetUserNotifyShopsBloc
    extends Bloc<GetUserNotifyShopsEvent, GetUserNotifyShopsState> {
  GetUserNotifyShopsBloc() : super(GetUserNotifyShopsInitial()) {
    on<GetUserNotifyShopsEvent>((event, emit) async {
      if (event is GetUserNotifyShopsStartEvent) {
        emit(GetUserNotifyShopsLoading());
        final state = await GetUserNotifyShopsUseCase().call();
        if (state is DataSuccess) {
          emit(GetUserNotifyShopsLoaded(shopsList: state.data!));
        } else {
          emit(GetUserNotifyShopsError(message: state.error!));
        }
      }
    });
  }
}
