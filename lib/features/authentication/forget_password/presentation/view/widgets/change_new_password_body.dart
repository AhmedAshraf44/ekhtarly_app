import 'dart:developer';
import 'package:ekhtarly_app/core/utils/widgets/input_validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_all_content_text_form_field.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';
import '../../../../manger/forgot_password_change_cubit/forgot_password_change_cubit.dart';
import '../../../../data/models/person_model.dart';
import 'custom_text_forget_password.dart';

class ChangeNewPasswordBody extends StatefulWidget with InputValidationMixin {
  const ChangeNewPasswordBody({super.key, required this.model});
  final Model model;
  @override
  State<ChangeNewPasswordBody> createState() => _ChangeNewPasswordBodyState();
}

class _ChangeNewPasswordBodyState extends State<ChangeNewPasswordBody> {
  GlobalKey<FormState> forgetPasswordForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool validate = false;
  bool obscureText = true;
  IconData? suffixIcon = Icons.visibility;
  String? newPassword;
  String? confirmPassword;
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
            const Spacer(
              flex: 2,
            ),
            CustomTextForgetPassword(
              text: 'Change New Password',
              textDetails: validate
                  ? 'Enter a different password with the previous'
                  : 'Enter your registered email below',
              style: validate
                  ? const TextStyle(
                      color: Color(0xff828282),
                      fontWeight: FontWeight.w500,
                      fontSize: 14)
                  : Styles.textStyle16Regular.copyWith(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
            ),
            const SizedBox(
              height: 54,
            ),
            CustomAllContentTextFormField(
              validator: (password) {
                newPassword = password;
                log('newPassword : $newPassword');
                if (password?.isEmpty ?? true) {
                  return 'Password is Required';
                } else if (!widget.isPasswordValid(password.toString())) {
                  return 'At least 8 characters, Please enter a valid password';
                } else {
                  return null;
                }
              },
              textFormField: '**** **** ****',
              topTextFeild: 'New Password',
              colorTopTextFeild: kSecondaryColor,
              onChanged: (p0) {
                {
                  setState(() {
                    validate = forgetPasswordForm.currentState!.validate();
                  });
                }
              },
              icon: Icons.password,
              prefixIconColor: validate ? kSecondaryColor : kBlackColor,
              obscureText: obscureText,
              suffixIcon: suffixIcon,
              suffixIconColor: obscureText ? kSecondaryColor : kBlackColor,
              onPressed: () {
                obscureText = !obscureText;
                suffixIcon =
                    obscureText ? Icons.visibility : Icons.visibility_off;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomAllContentTextFormField(
              validator: (password) {
                confirmPassword = password;
                log('confirmPassword: $password');
                if (password?.isEmpty ?? true) {
                  return 'Password is Required';
                } else if (!widget.isPasswordValid(password.toString())) {
                  return 'At least 8 characters, Please enter a valid password';
                } else if (newPassword != password) {
                  return 'password not matching';
                } else {
                  return null;
                }
              },
              textFormField: '**** **** ****',
              topTextFeild: 'Confirm Password',
              colorTopTextFeild: kSecondaryColor,
              onChanged: (p0) {
                {
                  setState(() {
                    validate = forgetPasswordForm.currentState!.validate();
                  });
                }
              },
              icon: Icons.password,
              prefixIconColor: validate ? kSecondaryColor : kBlackColor,
              obscureText: true,
            ),
            const Spacer(flex: 4),
            Center(
              child: CustomButton(
                  onPressed: () {
                    if (forgetPasswordForm.currentState!.validate()) {
                      log('email: ${widget.model.email}, code: ${widget.model.code}, password: ${confirmPassword!},');
                      BlocProvider.of<ForgotPasswordChangeCubit>(context)
                          .forgotPasswordChange(
                        email: widget.model.email,
                        code: widget.model.code,
                        password: confirmPassword!,
                      );
                    } else {
                      setState(() {
                        validate = false;
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: validate ? 'Reset Password' : 'Submit',
                  colorButton: validate ? kPrimaryColor : kAlternateButtonColor,
                  colorText: validate ? Colors.white : kButtonColor),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
