part of 'scan_user_card_bloc.dart';

@immutable
sealed class ScanUserCardState {}

final class ScanUserCardInitial extends ScanUserCardState {}

final class ScanUserCardLoading extends ScanUserCardState {}

final class ScanUserCardSuccess extends ScanUserCardState {}

final class ScanUserCardError extends ScanUserCardState {
  final String message;

  ScanUserCardError({required this.message});
}
