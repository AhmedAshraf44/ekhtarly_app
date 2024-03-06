import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_all_content_text_form_field.dart';
import 'custom_text_forget_password.dart';
import '../../../../../core/utils/widgets/custom_widget_row_text.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  GlobalKey <FormState> forgetPasswordForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Form(
        key: forgetPasswordForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const  Spacer(
              flex: 2,
             ),
             const CustomTextForgetPassword(
               text: 'Forget Password',
              textDetails: 'Enter your registered email below',
             ),
            const SizedBox(
              height:54,
            ),
            CustomAllContentTextFormField(
            textFormField: 'Eg namaemail@emailkamu.com ',
            topTextFeild: 'Email address', 
            colorTopTextFeild: validate ? kSecondaryColor : kBlackColor,
            onChanged:(p0) {
              {
                setState(() {
                validate =forgetPasswordForm.currentState!.validate();

                });
              }
              
            },
            icon: Icons.email_outlined, prefixIconColor: validate ? kSecondaryColor : kBlackColor,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomWidgetRowText(
            featureText:'Sign in' ,
            text: 'Remember the password?',
            textColor: kSecondaryColor,
            onTap: () {
                  GoRouter.of(context).pop();
                },
          ),
         const  Spacer(flex: 4),
           Center(
             child: CustomButton(
              onPressed: (){
                if(forgetPasswordForm.currentState!.validate())
                {
                 GoRouter.of(context).push(AppRouter.kCheckEmailView);
                }else {
                  setState(() {
                    validate = false ;
                   autovalidateMode = AutovalidateMode.always;
                  });
                  
                }
              }, 
             text: 'Submit', 
             colorButton: validate ? kPrimaryColor : kAlternateButtonColor,
                     colorText:  validate ? Colors.white : kButtonColor),
           ),
            const  Spacer(),
          ],
        ),
      ),
    );
  }
}


