import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/data/models/login_with_qr_request_model.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class LoginWithQRVerifyUseCase
    extends TPUseCase<DataState<String>, LoginWithQrRequestModel> {
  @override
  Future<DataState<String>> call(param) =>
      getIt<ILoginRepository>().loginWithQRVerify(param);
}
