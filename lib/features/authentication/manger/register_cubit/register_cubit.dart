import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';
import 'package:ekhtarly_app/features/authentication/manger/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;
  // bool validate= false ;                 to work
  // bool obscureText = true;
  // IconData? suffixIcon = Icons.visibility;
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    {
      emit(RegisterLoading());
      var result = await authRepo.registerUser(
          name: name, email: email, password: password);

      result.fold(
          (failure) => emit(
                RegisterFailure(errorMessage: failure.errorMessage),
              ),
          (register) => emit(RegisterSuccess()));
    }
  }
  // updateObscureTextAndSuffixIcon(){
  //   obscureText = !obscureText;
  //   print(obscureText);
  // }
}
