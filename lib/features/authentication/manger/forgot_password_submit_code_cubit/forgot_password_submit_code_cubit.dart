import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';

part 'forgot_password_submit_code_state.dart';

class ForgotPasswordSubmitCodeCubit
    extends Cubit<ForgotPasswordSubmitCodeState> {
  ForgotPasswordSubmitCodeCubit(this.authRepo)
      : super(ForgotPasswordSubmitCodeInitial());

  final AuthRepo authRepo;

  String? code;
  Future<void> forgotPasswordSubmitCode({
    required String email,
    required String code,
  }) async {
    emit(ForgotPasswordSubmitCodeLoading());

    var result = await authRepo.forgotPasswordSubmitCode(
      email: email,
      code: code,
    );

    result.fold(
      (failure) => emit(
          ForgotPasswordSubmitCodeFailure(errorMessage: failure.errorMessage)),
      (resned) => emit(
        ForgotPasswordSubmitCodeSuccess(),
      ),
    );
  }
}
