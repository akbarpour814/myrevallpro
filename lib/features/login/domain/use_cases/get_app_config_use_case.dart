import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/models/app_config_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class GetAppConfigUseCase extends TUseCase<DataState<AppConfigModel>> {
  @override
  Future<DataState<AppConfigModel>> call() =>
      getIt<ILoginRepository>().getAppConfig();
}
