import 'dart:io';
import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class UploadAvatarUseCase extends TPUseCase<DataState<String>, File> {
  @override
  Future<DataState<String>> call(param) =>
      getIt<ILoginRepository>().uploadAvatar(param);
}
