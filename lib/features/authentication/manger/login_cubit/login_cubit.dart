import 'package:ekhtarly_app/features/authentication/manger/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    {
      emit(LoginLoading());
      var result = await authRepo.loginUser(email: email, password: password);
      result.fold(
        (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
        (login) => emit(LoginSuccess()),
      );
    }
  }
}
