part of 'forgot_password_send_code_cubit.dart';

sealed class ForgotPasswordSendCodeState extends Equatable {
  const ForgotPasswordSendCodeState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordSendCodeInitial extends ForgotPasswordSendCodeState {}

final class ForgotPasswordSendCodeLoading extends ForgotPasswordSendCodeState {}

final class ForgotPasswordSendCodeSuccess extends ForgotPasswordSendCodeState {}

final class ForgotPasswordSendCodeFailure extends ForgotPasswordSendCodeState {
  final String errorMessage;
  const ForgotPasswordSendCodeFailure({required this.errorMessage});
}
