import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/guild_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/domain/use_cases/get_guild_use_case.dart';
import 'package:meta/meta.dart';

part 'get_guild_event.dart';
part 'get_guild_state.dart';

class GetGuildBloc extends Bloc<GetGuildEvent, GetGuildState> {
  GetGuildBloc() : super(GetGuildInitial()) {
    on<GetGuildEvent>((event, emit) async {
      if (event is GetGuildStartEvent) {
        emit(GetGuildLoading());
        final state = await GetGuildUseCase().call();
        if (state is DataSuccess) {
          emit(GetGuildLoaded(guildList: state.data!));
        } else {
          emit(GetGuildError(message: state.error!));
        }
      }
    });
  }
}
