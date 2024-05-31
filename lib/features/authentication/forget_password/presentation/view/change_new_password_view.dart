import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../manger/forgot_password_change_cubit/forgot_password_change_cubit.dart';
import '../../../data/models/person_model.dart';
import 'widgets/change_new_password_body.dart';

class ChangeNewPasswordView extends StatelessWidget {
  const ChangeNewPasswordView({super.key, required this.model});
  final Model model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ForgotPasswordChangeCubit, ForgotPasswordChangeState>(
        listener: (context, state) {
          if (state is ForgotPasswordChangeSuccess) {
            GoRouter.of(context).push(AppRouter.kSuccessView);
          } else if (state is ForgotPasswordChangeFailure) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is ForgotPasswordChangeLoading,
              child: ChangeNewPasswordBody(
                model: model,
              ));
        },
      ),
    );
  }
}
