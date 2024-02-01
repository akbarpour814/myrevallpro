import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/shop_details_model/shop_detail_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:customer_club/features/login/domain/use_cases/get_profile_use_case.dart';
import 'package:customer_club/features/login/domain/use_cases/get_shop_details_use_case.dart';
import 'package:meta/meta.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      if (event is GetProfileStartEvent || event is GetProfileNumNotifEvent) {
        if (event is GetProfileStartEvent) emit(GetProfileLoading());
        final state = await GetProfileUseCase().call();
        if (state is DataSuccess) {
          if (event is GetProfileStartEvent &&
              state.data!.shopId.isNotNullOrEmpty) {
            final shopState = await GetShopDetailsUseCase()
                .call(int.parse(state.data!.shopId!));
            if (shopState is DataSuccess) {
              emit(GetProfileLoaded(
                  user: state.data!, shopModel: shopState.data?.shop));
            }
          } else {
            emit(GetProfileLoaded(
                user: state.data!,
                shopModel: event is GetProfileNumNotifEvent
                    ? event.shopDetailModel
                    : null));
          }
        } else if (event is! GetProfileNumNotifEvent) {
          emit(GetProfileError(message: state.error!));
        }
      }
    });
  }
}
