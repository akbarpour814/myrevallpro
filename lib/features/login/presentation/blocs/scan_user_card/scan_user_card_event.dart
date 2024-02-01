part of 'scan_user_card_bloc.dart';

@immutable
sealed class ScanUserCardEvent {}

class ScanUserCardStartEvent extends ScanUserCardEvent {
  final String qr;

  ScanUserCardStartEvent({required this.qr});
}
