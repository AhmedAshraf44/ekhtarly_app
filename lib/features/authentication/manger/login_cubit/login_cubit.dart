import 'package:ekhtarly_app/features/authentication/manger/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repos/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(LoginLoading());
      var result = await authRepo.loginUser(email: email, password: password);
      result.fold(
        (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
        (login) {
          prefs.setString('token', login.token.toString());
          emit(LoginSuccess());
        },
      );
    }
  }
}
