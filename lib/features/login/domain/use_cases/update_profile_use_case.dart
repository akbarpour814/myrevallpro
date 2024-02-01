import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class UpdateProfileUseCase extends TPUseCase<DataState, UserModel> {
  @override
  Future<DataState> call(param) =>
      getIt<ILoginRepository>().updateProfile(param);
}
