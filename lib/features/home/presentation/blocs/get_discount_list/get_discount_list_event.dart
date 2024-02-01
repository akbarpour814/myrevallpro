part of 'get_discount_list_bloc.dart';

@immutable
sealed class GetDiscountListEvent {}

class GetDiscountListStartEvent extends GetDiscountListEvent {
  final int shopId;

  GetDiscountListStartEvent({required this.shopId});
}
