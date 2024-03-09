import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_all_content_text_form_field.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_featured_text.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_widget_row_text.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBodyDetails extends StatefulWidget {
  const LoginBodyDetails({super.key,});

  @override
  State<LoginBodyDetails> createState() => _LoginBodyDetailsState();
}

class _LoginBodyDetailsState extends State<LoginBodyDetails> {
GlobalKey <FormState> loginFormKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool validate = false;
bool obscureText = true ;
IconData? suffixIcon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Spacer(
            flex: 2,
          ),
          CustomAllContentTextFormField(
            textFormField: 'Eg namaemail@emailkamu.com ',
            topTextFeild: 'Email address', 
            colorTopTextFeild: validate ? kSecondaryColor :kBlackColor, 
            onChanged: (value) {
                      setState(() {
                        validate = loginFormKey.currentState!.validate();
                      });
            }, icon: Icons.email_outlined, prefixIconColor: validate ? kSecondaryColor : kBlackColor,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomAllContentTextFormField(
            textFormField: '**** **** **** ',
            topTextFeild: 'Password', 
            colorTopTextFeild:validate ? kSecondaryColor :kBlackColor, 
            onChanged: (value) {
                      setState(() {
                        validate = loginFormKey.currentState!.validate();
                      });
            }, icon: Icons.password, prefixIconColor: validate ? kSecondaryColor : kBlackColor,
            obscureText: obscureText,
            suffixIcon: suffixIcon ,
            suffixIconColor: obscureText ? kSecondaryColor : kBlackColor,
            onPressed: ()
            {
              setState(() {
                obscureText = !obscureText ;
                suffixIcon = obscureText ? Icons.visibility:Icons.visibility_off  ;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomFeaturedText(
                  text: 'Forget Password?', color: kPrimaryColor,
                  onTap: () {
                  GoRouter.of(context).push(AppRouter.kForgetPasswordView);
                  },
                  ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Center(
              child: CustomButton(
                  onPressed:() {
                      if (loginFormKey.currentState!.validate()) {
                        
                        loginFormKey.currentState!.save();
                        GoRouter.of(context).push(AppRouter.kHomeView);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        validate = false;
                        });
                      }
                    },
                  text: 'Login',
                  colorButton: validate ? kPrimaryColor : kAlternateButtonColor,
                  colorText: validate ? Colors.white : kButtonColor,
                  ),),
          const SizedBox(
            height: 16,
          ),
          Center(
              child: CustomTextButton(onTap: (){}, 
              text: 'Login with Google',
               colorButton: kAlternateButtonColor, 
               colorText: kBlackColor,),      
            ),
        const  Spacer(),
            CustomWidgetRowText(
              text: 'Haven\'t an account? ', textColor:kThridColor, featureText: 'Register',
              mainAxisAlignment: MainAxisAlignment.center,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
              ),
          const  SizedBox(
            height: 8,
            ),   
        ],
      ),
    );
  }
}




