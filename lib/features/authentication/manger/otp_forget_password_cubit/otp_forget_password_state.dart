part of 'otp_forget_password_cubit.dart';

sealed class OtpForgetPasswordState extends Equatable {
  const OtpForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class OtpForgetPasswordInitial extends OtpForgetPasswordState {}
final class OtpForgetPasswordLoading extends OtpForgetPasswordState {}
final class OtpForgetPasswordSuccess extends OtpForgetPasswordState {}
final class OtpForgetPasswordFailure extends OtpForgetPasswordState {
    final String errorMessage ;
 const OtpForgetPasswordFailure({required this.errorMessage});
}

