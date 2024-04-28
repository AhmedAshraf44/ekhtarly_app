import 'package:ekhtarly_app/features/authentication/login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/auth_repo_impl.dart';
import '../../../manger/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
