part of 'sign_out_bloc.dart';

@immutable
sealed class SignOutEvent {}

class SignOutRequestEvent extends SignOutEvent{}