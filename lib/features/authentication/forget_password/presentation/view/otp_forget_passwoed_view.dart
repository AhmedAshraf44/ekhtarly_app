import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:ekhtarly_app/features/authentication/forget_password/presentation/view_models/model.dart';
import 'package:ekhtarly_app/features/authentication/manger/forgot_password_submit_code_cubit/forgot_password_submit_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/utils/app_router.dart';
import 'widgets/otp_forget_password_view_body.dart';

class OtpForgetPasswordView extends StatelessWidget {
  const OtpForgetPasswordView({
    super.key,
    required this.email,
  });
  final String email;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ForgotPasswordSubmitCodeCubit, ForgotPasswordSubmitCodeState>(
        listener: (context, state) {
          if ( state is ForgotPasswordSubmitCodeSuccess)
          {
             final Model model =Model(email: email, code:  BlocProvider.of<ForgotPasswordSubmitCodeCubit>(context).code!,);

             GoRouter.of(context).push(AppRouter.kChangeNewPasswordView,extra: model,);
          }else if (state is ForgotPasswordSubmitCodeFailure)
          {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ForgotPasswordSubmitCodeLoading,
            child: OtpForgetPasswordViewBody(email: email,));
        },
      ),
    );
  }
}
