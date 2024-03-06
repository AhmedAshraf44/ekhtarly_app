import 'package:flutter/material.dart';

import 'widgets/change_new_password_body.dart';

class ChangeNewPasswordView extends StatelessWidget {
  const ChangeNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangeNewPasswordBody(),
    );
  }
}