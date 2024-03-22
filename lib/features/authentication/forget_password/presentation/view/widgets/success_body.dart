import 'package:ekhtarly_app/features/authentication/forget_password/presentation/view/widgets/custom_text_success.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           const Spacer(flex: 4,),
            CustomTextSuccess(
            text: 'Congratulations your password has been changed,',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff828282),
            ),
           ),
            const SizedBox(
              height: 28,
            ),
           const Spacer(
              flex: 2,
             ),
          CustomButton(onPressed: (){
                    GoRouter.of(context).push(AppRouter.kRegisterView);
                  },
           text: 'Sign in',
            colorButton: kPrimaryColor,
             colorText: Colors.white),
           const Spacer(),
        ],
      ),
    );
  }
}

