import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_all_content_text_form_field.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_featured_text.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_widget_row_text.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_text_button.dart';
import 'package:ekhtarly_app/features/authentication/manger/login_cubit/login_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/widgets/input_validation_mixin.dart';

class LoginBodyDetails extends StatefulWidget with InputValidationMixin {
  const LoginBodyDetails({
    super.key,
  });

  @override
  State<LoginBodyDetails> createState() => _LoginBodyDetailsState();
}

class _LoginBodyDetailsState extends State<LoginBodyDetails> {
  GlobalKey<FormState> loginFormKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool validate = false;
  bool obscureText = true;
  IconData? suffixIcon = Icons.visibility;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          //showSnackBar(context, 'sucess');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Form(
            key: loginFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                    CustomAllContentTextFormField(
                      validator: (email) {
                        if (email?.isEmpty ?? true) {
                          return 'Email is Required';
                        } else if (!widget.isEmailValid(email.toString())) {
                          return 'Email address is invalid, Please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      textFormField: 'Eg namaemail@emailkamu.com ',
                      topTextFeild: 'Email address',
                      colorTopTextFeild:
                          validate ? kSecondaryColor : kBlackColor,
                      onChanged: (value) {
                        email = value;
                        setState(() {
                          validate = loginFormKey.currentState!.validate();
                        });
                      },
                      icon: Icons.email_outlined,
                      prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomAllContentTextFormField(
                      validator: (password) {
                        if (password?.isEmpty ?? true) {
                          return 'Password is Required';
                        } else if (!widget
                            .isPasswordValid(password.toString())) {
                          return 'At least 8 characters, Please enter a valid password';
                        } else {
                          return null;
                        }
                      },
                      textFormField: '**** **** **** ',
                      topTextFeild: 'Password',
                      colorTopTextFeild:
                          validate ? kSecondaryColor : kBlackColor,
                      onChanged: (value) {
                        password = value;
                        setState(() {
                          validate = loginFormKey.currentState!.validate();
                        });
                      },
                      icon: Icons.password,
                      prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                      obscureText: obscureText,
                      suffixIcon: suffixIcon,
                      suffixIconColor:
                          obscureText ? kSecondaryColor : kBlackColor,
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                          suffixIcon = obscureText
                              ? Icons.visibility
                              : Icons.visibility_off;
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
                          text: 'Forget Password?',
                          color: kPrimaryColor,
                          onTap: () {
                            GoRouter.of(context)
                                .push(AppRouter.kForgetPasswordView);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          if (loginFormKey.currentState!.validate()) {
                            loginFormKey.currentState!.save();
                            BlocProvider.of<LoginCubit>(context).loginUser(
                              email: email!,
                              password: password!,
                            );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                              validate = false;
                            });
                          }
                        },
                        text: 'Login',
                        colorButton:
                            validate ? kPrimaryColor : kAlternateButtonColor,
                        colorText: validate ? Colors.white : kButtonColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: CustomTextButton(
                        onTap: () {},
                        text: 'Login with Google',
                        colorButton: kAlternateButtonColor,
                        colorText: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    CustomWidgetRowText(
                      text: 'Haven\'t an account? ',
                      textColor: kThridColor,
                      featureText: 'Register',
                      mainAxisAlignment: MainAxisAlignment.center,
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
