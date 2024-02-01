part of 'get_shop_rating_bloc.dart';

@immutable
sealed class GetShopRatingState {}

final class GetShopRatingInitial extends GetShopRatingState {}

final class GetShopRatingLoading extends GetShopRatingState {}

final class GetShopRatingLoaded extends GetShopRatingState {
  final List<CommentModel> commentList;

  GetShopRatingLoaded({required this.commentList});
}

final class GetShopRatingError extends GetShopRatingState {
  final String message;

  GetShopRatingError({required this.message});
}
