import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/models/guild_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class GetGuildUseCase extends TUseCase<DataState<List<GuildModel>>> {
  @override
  Future<DataState<List<GuildModel>>> call() =>
      getIt<IHomeRepository>().getGuilds();
}
