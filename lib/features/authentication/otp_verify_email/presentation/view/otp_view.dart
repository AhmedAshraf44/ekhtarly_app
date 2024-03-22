import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/auth_repo_impl.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, this.email});
final String? email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OtpViewBody(email: email,authRepo: getIt.get<AuthRepoImpl>(),),
    );
  }
}
