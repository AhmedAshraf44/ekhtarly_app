import 'dart:async';
import 'dart:developer';
import 'package:ekhtarly_app/core/utils/widgets/custom_widget_row_text.dart';
import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/widgets/custom_text_otp.dart';
import 'package:ekhtarly_app/features/forget_password/presentation/view/widgets/custom_text_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, required this.email});
  final String? email;
  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  bool validate = false;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          CustomTextOtp(
            text: 'Verification Code',
            textDetails:
                'Verification code has been sent to your email : ',
            targetWord: '${widget.email}',
          ),
          const SizedBox(
            height: 50,
          ),
          PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: kAlternateButtonColor,
                activeColor: kBlackColor,
                selectedColor: kPrimaryColor,
                selectedFillColor: Colors.white,
                inactiveColor: kSecondaryColor,
                inactiveFillColor: kSecondaryColor,
                disabledColor: kBlackColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              errorAnimationController: errorController,
              controller: textEditingController,
              onCompleted: (v) {
                log("complete:  $v");
              },
              onChanged: (value) {
                log('onChanged: $value');
                 if (value.length == 6) {
                  validate = true;
                  setState(() {});
                }else
                {
                   validate = false;
                  setState(() {});
                }
                setState(() {
                  //currentText = value;
                  //log(value);
                });
              }
              // beforeTextPaste: (text) {
              //   print("Allowing to paste $text");
              //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //   return true;
              // },
              ),
          const SizedBox(
            height: 36,
          ),
          const CustomWidgetRowText(
            featureText: 'Resend',
            text: 'Don\'t receive this code ? ',
            textColor: kSecondaryColor,
            // onTap: () {
            //       GoRouter.of(context).pop();
            //     },
          ),
          const Spacer(flex: 4),
          Center(
            child: CustomButton(
                onPressed: () {
                  // if (otpForm.currentState!.validate()) {
                  //   // GoRouter.of(context).push(AppRouter.kCheckEmailView);
                  // } else {
                  //   setState(() {
                  //     validate = false;
                  //     // autovalidateMode = AutovalidateMode.always;
                  //   });
                  // }
                },
                text: 'Confirm',
                colorButton: validate ? kPrimaryColor : kAlternateButtonColor,
                colorText: validate ? Colors.white : kButtonColor),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
