import 'package:ekhtarly_app/features/authentication/manger/otp_forget_password_cubit/otp_forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_router.dart';
import 'widgets/otp_forget_password_vew_body.dart';

class OtpForgetPasswordView extends StatelessWidget {
  const OtpForgetPasswordView({super.key, required this.email,});
final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: OtpForgetPasswordViewBody(email: email),
     );
  }
}