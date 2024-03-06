import 'package:ekhtarly_app/features/authentication/login/view/widgets/login_body_details.dart';
import 'package:flutter/material.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child:  LoginBodyDetails(),
    );
  }
}

