import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/domain/use_cases/get_city_use_case.dart';
import 'package:meta/meta.dart';

part 'city_list_event.dart';
part 'city_list_state.dart';

class CityListBloc extends Bloc<CityListEvent, CityListState> {
  CityListBloc() : super(CityListInitial()) {
    on<CityListEvent>((event, emit) async {
      if (event is CityListRequestEvent) {
        emit(CityListLoading());
        final state = await GetCityUseCase().call();
        if (state is DataSuccess) {
          emit(CityListLoaded(state.data!));
        } else {
          emit(CityListError(state.error!));
        }
      }
    });
  }
}
