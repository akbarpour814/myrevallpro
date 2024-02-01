part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchWithQueryEvent extends SearchEvent {
  final String query;

  SearchWithQueryEvent({required this.query});
}

class SearchWithQREvent extends SearchEvent {
  final String QR;

  SearchWithQREvent({required this.QR});
}

class SearchClearEvent extends SearchEvent {}
