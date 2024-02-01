import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/home/data/models/discount_model.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class GetDiscountListUseCase
    extends TPUseCase<DataState<List<DiscountModel>>, int> {
  @override
  Future<DataState<List<DiscountModel>>> call(param) =>
      getIt<IHomeRepository>().getDiscountList(param);
}
