part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordfailure extends ChangePasswordState {
  final String message;

  ChangePasswordfailure({required this.message});
}

final class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  ChangePasswordSuccess({required this.message});
}
