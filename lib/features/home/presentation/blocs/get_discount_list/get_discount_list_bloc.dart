import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/data/models/discount_model.dart';
import 'package:customer_club/features/home/domain/use_cases/get_discount_list_use_case.dart';
import 'package:meta/meta.dart';

part 'get_discount_list_event.dart';
part 'get_discount_list_state.dart';

class GetDiscountListBloc
    extends Bloc<GetDiscountListEvent, GetDiscountListState> {
  GetDiscountListBloc() : super(GetDiscountListInitial()) {
    on<GetDiscountListEvent>((event, emit) async {
      if (event is GetDiscountListStartEvent) {
        emit(GetDiscountListLoading());
        final state = await GetDiscountListUseCase().call(event.shopId);
        if (state is DataSuccess) {
          emit(GetDiscountListLoaded(discountList: state.data!));
        } else {
          emit(GetDiscountListError(message: state.error!));
        }
      }
    });
  }
}
