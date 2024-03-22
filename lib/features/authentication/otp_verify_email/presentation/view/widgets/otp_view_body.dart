import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_state.dart';
import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/widgets/otp_view_body_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class OtpViewBody extends StatelessWidget {
  const OtpViewBody({
    super.key,
    required this.email,
  });
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is OtpFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is OtplLoading,
        child:OtpViewBodyDetails(email: email),
      ),
    );
  }
}

