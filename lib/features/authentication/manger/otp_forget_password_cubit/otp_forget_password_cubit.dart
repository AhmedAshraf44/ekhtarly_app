import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';

part 'otp_forget_password_state.dart';

class OtpForgetPasswordCubit extends Cubit<OtpForgetPasswordState> {
  OtpForgetPasswordCubit(this.authRepo) : super(OtpForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> forgotPasswordSendCode({
    required String email,
  }) async {
    emit(OtpForgetPasswordLoading());
    var result = await authRepo.forgotPasswordSendCode(email: email);

    result.fold(
      (failure) => emit(OtpForgetPasswordFailure(errorMessage: failure.errorMessage)),
      (resned) => emit(
        OtpForgetPasswordSuccess(),
      ),
    );
  }
}
