import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/app_config_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/domain/use_cases/get_app_config_use_case.dart';
import 'package:meta/meta.dart';

part 'get_app_config_event.dart';
part 'get_app_config_state.dart';

class GetAppConfigBloc extends Bloc<GetAppConfigEvent, GetAppConfigState> {
  GetAppConfigBloc() : super(GetAppConfigInitial()) {
    on<GetAppConfigEvent>((event, emit) async {
      if (event is GetAppConfigStartEvent) {
        emit(GetAppConfigLoading());
        final state = await GetAppConfigUseCase().call();
        if (state is DataSuccess) {
          emit(GetAppConfigLoaded(configModel: state.data!));
        } else {
          emit(GetAppConfigError(message: state.error!));
        }
      }
    });
  }
}
