import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.authRepo) : super(OtpInitial());
  final AuthRepo authRepo;
  Future<void> otpVerifyEmail({
    required String email,
    required String code,
  }) async {
    emit(OtplLoading());
    var result = await authRepo.otpVerifyEmail(email: email, code: code);
    result.fold(
        (failure) => emit(OtpFailure(errorMessage: failure.errorMessage)),
        (otpSuccess) => emit(OtpSuccess()));
  }

  Future<void> resendVerifyCode({
    required String email,
  }) async {
    emit(OtplLoading());
    var result = await authRepo.resendVerifyCode(
      email: email,
    );
    result.fold(
        (failure) => emit(OtpFailure(errorMessage: failure.errorMessage)),
        (otpSuccess) => emit(OtpSuccess()));
  }
}
