import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';

part 'forgot_password_change_state.dart';

class ForgotPasswordChangeCubit extends Cubit<ForgotPasswordChangeState> {
  ForgotPasswordChangeCubit(this.authRepo) : super(ForgotPasswordChangeInitial());

   final AuthRepo authRepo;

  Future<void> forgotPasswordChange({
    required String email,
    required String code,
    required String password
  }) async {
    emit(ForgotPasswordChangeLoading());
    var result = await authRepo.forgotPasswordChange(email: email,code: code,password: password,);

    result.fold(
      (failure) => emit(ForgotPasswordChangeFailure(errorMessage: failure.errorMessage)),
      (resned) => emit(
        ForgotPasswordChangeSuccess(),
      ),
    );
  }
}
