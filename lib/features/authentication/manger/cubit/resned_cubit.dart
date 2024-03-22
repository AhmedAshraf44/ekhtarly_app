import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resned_state.dart';

class ResnedCubit extends Cubit<ResnedState> {
  ResnedCubit(this.authRepo) : super(ResnedInitial());

  final AuthRepo authRepo;

  Future<void> resendVerifyCode({
    required String email,
  }) async {
    emit(ResnedLoading());
    var result = await authRepo.resendVerifyCode(email: email);

    result.fold(
      (failure) => emit(ResnedFailure(errorMessage: failure.errorMessage)),
      (resned) => emit(
        ResnedSuccess(successMessage: resned['message'].toString()),
      ),
    );
  }
}
