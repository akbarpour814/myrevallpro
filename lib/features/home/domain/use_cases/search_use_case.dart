import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class SearchUseCase extends TPUseCase<DataState<List<ShopModel>>, String> {
  @override
  Future<DataState<List<ShopModel>>> call(param) =>
      getIt<IHomeRepository>().searchShops(param);
}
