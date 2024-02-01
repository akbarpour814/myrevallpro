import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/models/shop_details_model/shop_all_details_model.dart';
import 'package:customer_club/features/home/domain/use_cases/get_shop_details_use_case.dart';
import 'package:meta/meta.dart';

part 'get_shop_details_event.dart';
part 'get_shop_details_state.dart';

class GetShopDetailsBloc
    extends Bloc<GetShopDetailsEvent, GetShopDetailsState> {
  GetShopDetailsBloc() : super(GetShopDetailsInitial()) {
    on<GetShopDetailsEvent>((event, emit) async {
      if (event is GetShopDetailsStartEvent) {
        emit(GetShopDetailsLoading());
        final state = await GetShopDetailsUseCase().call(event.shopId);
        if (state is DataSuccess) {
          emit(GetShopDetailsLoaded(shopAllDetailsModel: state.data!));
        } else {
          emit(GetShopDetailsError(message: state.error!));
        }
      }
    });
  }
}
