part of 'get_discount_list_bloc.dart';

@immutable
sealed class GetDiscountListState {}

final class GetDiscountListInitial extends GetDiscountListState {}

final class GetDiscountListLoading extends GetDiscountListState {}

final class GetDiscountListLoaded extends GetDiscountListState {
  final List<DiscountModel> discountList;

  GetDiscountListLoaded({required this.discountList});
}

final class GetDiscountListError extends GetDiscountListState {
  final String message;

  GetDiscountListError({required this.message});
}
