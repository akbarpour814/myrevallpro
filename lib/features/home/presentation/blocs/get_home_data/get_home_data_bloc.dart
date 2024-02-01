import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/data/models/home_data_model.dart';
import 'package:customer_club/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:meta/meta.dart';

part 'get_home_data_event.dart';
part 'get_home_data_state.dart';

class GetHomeDataBloc extends Bloc<GetHomeDataEvent, GetHomeDataState> {
  GetHomeDataBloc() : super(GetHomeDataInitial()) {
    on<GetHomeDataEvent>((event, emit) async {
      if (event is GetHomeDataStartEvent) {
        emit(GetHomeDataLoading());
        final state = await GetHomeDataUseCase().call();
        if (state is DataSuccess) {
          emit(GetHomeDataLoaded(homeDataModel: state.data!));
        } else {
          emit(GetHomeDataError(message: state.error!));
        }
      }
    });
  }
}
