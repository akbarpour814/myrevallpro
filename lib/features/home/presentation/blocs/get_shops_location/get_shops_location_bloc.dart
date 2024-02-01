import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/domain/use_cases/get_all_shop_location_use_case.dart';
import 'package:meta/meta.dart';

part 'get_shops_location_event.dart';
part 'get_shops_location_state.dart';

class GetShopsLocationBloc
    extends Bloc<GetShopsLocationEvent, GetShopsLocationState> {
  GetShopsLocationBloc() : super(GetShopsLocationInitial()) {
    on<GetShopsLocationEvent>((event, emit) async {
      if (event is GetShopsLocationStartEvent) {
        emit(GetShopsLocationLoading());
        final state = await GetAllShopLocationUseCase().call();
        if (state is DataSuccess) {
          emit(GetShopsLocationLoaded(shopList: state.data!));
        } else {
          emit(GetShopsLocationError(message: state.error!));
        }
      }
    });
  }
}
