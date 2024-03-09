import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';
import 'package:ekhtarly_app/features/authentication/login/manger/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;
  Future<void> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    {
      print('loading');
      emit(RegisterLoading());
      var result = await authRepo.registerUser(
          name: name, email: email, password: password);

      result.fold(
          (failure) => emit(
                RegisterFailure(errorMessage: failure.errorMessage),
              ),
              
          (register) => emit(RegisterSuccess()));
                print('fuilure or success');
    }
  }
}
