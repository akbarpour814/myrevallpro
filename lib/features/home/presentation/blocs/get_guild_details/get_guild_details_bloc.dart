import 'package:bloc/bloc.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/data/models/guild_details_model.dart';
import 'package:customer_club/features/home/domain/use_cases/get_guild_details_use_case.dart';
import 'package:meta/meta.dart';

part 'get_guild_details_event.dart';
part 'get_guild_details_state.dart';

class GetGuildDetailsBloc
    extends Bloc<GetGuildDetailsEvent, GetGuildDetailsState> {
  GetGuildDetailsBloc() : super(GetGuildDetailsInitial()) {
    on<GetGuildDetailsEvent>((event, emit) async {
      if (event is GetGuildDetailsStartEvent) {
        emit(GetGuildDetailsLoading());
        final state = await GetGuildDetailsUseCase().call(event.guildId);
        if (state is DataSuccess) {
          emit(GetGuildDetailsLoaded(guildDetailsModel: state.data!));
        } else {
          emit(GetGuildDetailsError(message: state.error!));
        }
      }
    });
  }
}
