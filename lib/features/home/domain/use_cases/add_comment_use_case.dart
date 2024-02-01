import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/use_case.dart';
import 'package:customer_club/features/home/data/models/comment_request_model.dart';
import 'package:customer_club/features/home/domain/repository/home_repository.dart';

class AddCommentUseCase extends TPUseCase<DataState,CommentRequestModel> {
  @override
  Future<DataState> call(param) =>
      getIt<IHomeRepository>().addComment(param);
}
