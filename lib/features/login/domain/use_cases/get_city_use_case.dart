import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';

class GetCityUseCase extends TUseCase<DataState<List<CityModel>>> {
  @override
  Future<DataState<List<CityModel>>> call() =>
      getIt<ILoginRepository>().getAllCity();
}
