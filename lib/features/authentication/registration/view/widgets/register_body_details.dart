import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_text_button.dart';
import 'package:ekhtarly_app/features/authentication/login/manger/login_cubit/login_cubit.dart';
import 'package:ekhtarly_app/features/authentication/login/manger/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../../core/utils/widgets/custom_all_content_text_form_field.dart';
import '../../../../../core/utils/widgets/custom_widget_row_text.dart';

class RegisterBodyDetails extends StatefulWidget {
  const RegisterBodyDetails({
    super.key,
  });

  @override
  State<RegisterBodyDetails> createState() => _RegisterBodyDetailsState();
}

class _RegisterBodyDetailsState extends State<RegisterBodyDetails> {
  final GlobalKey<FormState> registerFormKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool validate = false;
  bool obscureText = true;
  IconData? suffixIcon = Icons.visibility;
  String? email;
  String? password;
   String? name;
   bool isLoading = false ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      if (state is RegisterSuccess)
      {    isLoading = false ;
        showSnackBar(context,'sucess');
        GoRouter.of(context).push(AppRouter.kHomeView);
      }else if ( state is RegisterFailure)
      {    isLoading = false ;
       showSnackBar(context,state.errorMessage);
      }
      else if (state is RegisterLoading)
      {
        isLoading = true ;
      }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading ,
          child: Form(
            key: registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                CustomAllContentTextFormField(
                  textFormField: 'Enter your full name ',
                  topTextFeild: 'Full Name',
                  colorTopTextFeild: validate ? kSecondaryColor : kBlackColor,
                  onChanged: (value) {
                    name =value ;
                    setState(() {
                      validate = registerFormKey.currentState!.validate();
                    });
                  },
                  icon: Icons.person_2_rounded,
                  prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomAllContentTextFormField(
                  textFormField: 'Eg namaemail@emailkamu.com ',
                  topTextFeild: 'Email address',
                  colorTopTextFeild: validate ? kSecondaryColor : kBlackColor,
                  onChanged: (value) {
                    email =value;
                    setState(() {
                      validate = registerFormKey.currentState!.validate();
                    });
                  },
                  icon: Icons.email_outlined,
                  prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomAllContentTextFormField(
                  textFormField: '**** **** **** ',
                  topTextFeild: 'Password',
                  colorTopTextFeild: validate ? kSecondaryColor : kBlackColor,
                  onChanged: (value) {
                    password =value ;
                    setState(() {
                      validate = registerFormKey.currentState!.validate();
                    });
                  },
                  icon: Icons.password,
                  prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                  obscureText: obscureText,
                  suffixIcon: suffixIcon,
                  suffixIconColor: obscureText ? kSecondaryColor : kBlackColor,
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                      suffixIcon =
                          obscureText ? Icons.visibility : Icons.visibility_off;
                    });
                  },
                ),
                const SizedBox(
                  height: 34,
                ),
                Center(
                    child: CustomButton(
                        onPressed: () {
                          if (registerFormKey.currentState!.validate()) {
                            registerFormKey.currentState!.save();
                            BlocProvider.of<RegisterCubit>(context).authRepo.registerUser(name: name!, email: email!, password: password!);
                             //GoRouter.of(context).push(AppRouter.kHomeView);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text('Processing Data')));
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                              validate = false;
                            });
                          }
                        },
                        text: 'Registration',
                        colorButton:
                            validate ? kPrimaryColor : kAlternateButtonColor,
                        colorText: validate ? Colors.white : kButtonColor)),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: CustomTextButton(
                    onTap: () {},
                    text: 'Sign up with Google',
                    colorText: kBlackColor,
                    colorButton: kAlternateButtonColor,
                  ),
                ),
                const Spacer(),
                CustomWidgetRowText(
                  text: 'Already Have Account? ',
                  textColor: kThridColor,
                  featureText: 'Login',
                  mainAxisAlignment: MainAxisAlignment.center,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
