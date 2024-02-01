import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/domain/use_cases/get_city_use_case.dart';
import 'package:meta/meta.dart';

part 'get_all_city_event.dart';
part 'get_all_city_state.dart';

class GetAllCityBloc extends Bloc<GetAllCityEvent, GetAllCityState> {
  GetAllCityBloc() : super(GetAllCityInitial()) {
    on<GetAllCityEvent>((event, emit) async {
      if (event is GetAllCityStartEvent) {
        emit(GetAllCityLoading());
        final state = await GetCityUseCase().call();
        if (state is DataSuccess) {
          emit(GetAllCityLoaded(cityList: state.data!));
        } else {
          emit(GetAllCityError(message: state.error!));
        }
      }
    });
  }
}
