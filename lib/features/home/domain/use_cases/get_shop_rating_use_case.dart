import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/home/data/models/comment_model.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class GetShopRatingUseCase
    extends TPUseCase<DataState<List<CommentModel>>, int> {
  @override
  Future<DataState<List<CommentModel>>> call(param) =>
      getIt<IHomeRepository>().getShopRating(param);
}
