import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/domain/use_cases/get_shop_location_use_case.dart';
import 'package:meta/meta.dart';

part 'get_shop_location_event.dart';
part 'get_shop_location_state.dart';

class GetShopLocationBloc
    extends Bloc<GetShopLocationEvent, GetShopLocationState> {
  GetShopLocationBloc() : super(GetShopLocationInitial()) {
    on<GetShopLocationEvent>((event, emit) async {
      if (event is GetShopLocationStartEvent) {
        emit(GetShopLocationLoading());
        final state = await GetShopLocationUseCase().call(event.shopId);
        if (state is DataSuccess) {
          emit(GetShopLocationLoaded(shopModel: state.data!));
        } else {
          emit(GetShopLocationError(message: state.error!));
        }
      }
    });
  }
}
