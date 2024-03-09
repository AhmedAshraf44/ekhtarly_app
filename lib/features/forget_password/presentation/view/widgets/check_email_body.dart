import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_widget_row_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_text_success.dart';

class CheckEmailBody extends StatelessWidget {
  const CheckEmailBody({super.key});

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
        const  CustomTextSuccess(
            text:'Please check your email for create a new password',
          ),
            const SizedBox(
              height: 28,
            ),
            CustomWidgetRowText(
              mainAxisAlignment: MainAxisAlignment.center,
              text: 'Can\'t get email?', textColor: kThridColor, featureText:  'Resubmit',
           onTap: () {
                   GoRouter.of(context).pop();
                  },
            ),
             const Spacer(
              flex: 2,
             ),
          CustomButton(onPressed: (){
                    GoRouter.of(context).push(AppRouter.kChangeNewPasswordView);
                  },
           text: 'Back Email',
            colorButton: kPrimaryColor,
             colorText: Colors.white),
           const Spacer(),
        ],
      ),
    );

  }
}