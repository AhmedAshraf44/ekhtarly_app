part of 'forgot_password_submit_code_cubit.dart';

sealed class ForgotPasswordSubmitCodeState extends Equatable {
  const ForgotPasswordSubmitCodeState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordSubmitCodeInitial
    extends ForgotPasswordSubmitCodeState {}

final class ForgotPasswordSubmitCodeLoading
    extends ForgotPasswordSubmitCodeState {}

final class ForgotPasswordSubmitCodeSuccess
    extends ForgotPasswordSubmitCodeState {}

final class ForgotPasswordSubmitCodeFailure
    extends ForgotPasswordSubmitCodeState {
  final String errorMessage;
  const ForgotPasswordSubmitCodeFailure({required this.errorMessage});
}
