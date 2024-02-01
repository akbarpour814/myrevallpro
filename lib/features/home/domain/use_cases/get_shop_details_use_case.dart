import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/core/models/shop_details_model/shop_all_details_model.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class GetShopDetailsUseCase
    extends TPUseCase<DataState<ShopAllDetailsModel>, int> {
  @override
  Future<DataState<ShopAllDetailsModel>> call(param) =>
      getIt<IHomeRepository>().getShopDetails(param);
}
