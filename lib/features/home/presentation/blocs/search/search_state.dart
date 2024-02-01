part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<ShopModel> shopList;
  final bool isQR;

  SearchLoaded({required this.shopList, required this.isQR});
}

final class SearchError extends SearchState {}
