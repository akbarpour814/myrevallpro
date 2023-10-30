part of 'add_new_bloc.dart';

@immutable
sealed class AddNewState {}

final class AddNewInitial extends AddNewState {}

final class AddNewLoading extends AddNewState {}

final class AddNewSuccess extends AddNewState {}

final class AddNewError extends AddNewState {
  final String message;

  AddNewError(this.message);
}
