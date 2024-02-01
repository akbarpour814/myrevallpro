import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class ScanUserCardUseCase extends TPUseCase<DataState, String> {
  @override
  Future<DataState> call(param) =>
      getIt<ILoginRepository>().scanUserCard(param);
}
