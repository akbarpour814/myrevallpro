import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/data/models/comment_model.dart';
import 'package:customer_club/features/home/domain/use_cases/get_shop_rating_use_case.dart';
import 'package:meta/meta.dart';

part 'get_shop_rating_event.dart';
part 'get_shop_rating_state.dart';

class GetShopRatingBloc extends Bloc<GetShopRatingEvent, GetShopRatingState> {
  GetShopRatingBloc() : super(GetShopRatingInitial()) {
    on<GetShopRatingEvent>((event, emit) async {
      if (event is GetShopRatingStartEvent) {
        emit(GetShopRatingLoading());
        final state = await GetShopRatingUseCase().call(event.shopId);
        if (state is DataSuccess) {
          emit(GetShopRatingLoaded(commentList: state.data!));
        } else {
          emit(GetShopRatingError(message: state.error!));
        }
      }
    });
  }
}
