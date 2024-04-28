part of 'forgot_password_change_cubit.dart';

sealed class ForgotPasswordChangeState extends Equatable {
  const ForgotPasswordChangeState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordChangeInitial extends ForgotPasswordChangeState {}

final class ForgotPasswordChangeLoading extends ForgotPasswordChangeState {}

final class ForgotPasswordChangeSuccess extends ForgotPasswordChangeState {}

final class ForgotPasswordChangeFailure extends ForgotPasswordChangeState {
  final String errorMessage;
  const ForgotPasswordChangeFailure({required this.errorMessage});
}
