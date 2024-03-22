import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';

part 'forgot_password_send_code_state.dart';

class ForgotPasswordSendCodeCubit extends Cubit<ForgotPasswordSendCodeState> {
  ForgotPasswordSendCodeCubit(this.authRepo) : super(ForgotPasswordSendCodeInitial());
  final AuthRepo authRepo;

  Future<void> forgotPasswordSendCode({
    required String email,
  }) async {
    emit(ForgotPasswordSendCodeLoading());
    var result = await authRepo.forgotPasswordSendCode(email: email);

    result.fold(
      (failure) => emit(ForgotPasswordSendCodeFailure(errorMessage: failure.errorMessage)),
      (resned) => emit(
        ForgotPasswordSendCodeSuccess(),
      ),
    );
  }
}
