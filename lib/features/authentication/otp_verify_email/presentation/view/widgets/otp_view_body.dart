import 'dart:async';
import 'dart:developer';
import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_widget_row_text.dart';
import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/otp_verify_email_cubit/otp_state.dart';
import 'package:ekhtarly_app/features/authentication/otp_verify_email/presentation/view/widgets/custom_text_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({
    super.key,
    required this.email,
    required this.authRepo,
  });
  final String? email;
  final AuthRepo authRepo;
  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  bool validate = false;
  String? code;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  int start = 30;
  bool wait =false ;
  void startTimer() {
    start = 30;
    const oneSec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        wait = false ;
        setState(() {
          timer.cancel();
        });

      } else {
        wait =true;
        setState(() {
          start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is OtpFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is OtplLoading,
        child: Padding(
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
                textDetails: 'Verification code has been sent to your email : ',
                targetWord: '${widget.email}',
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: kButtonColor,
                      margin: const EdgeInsets.only(right: 12),
                    ),
                  ),
                  const Text('Enter 6 digit OTP',
                      style: Styles.textStyle16Regular),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: kButtonColor,
                      margin: const EdgeInsets.only(left: 12),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
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
                    code = v;
                  },
                  onChanged: (value) {
                    log('onChanged: $value');
                    if (value.length == 6) {
                      validate = true;
                      setState(() {});
                    } else {
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
               CustomWidgetRowText(
                featureText: wait ? '00:$start sec' :'Resend'  ,
                text: 'Don\'t receive this code ? ',
                textColor: kSecondaryColor,
                 onTap: wait ? null :() async{
                  {
                  startTimer();
                    log(start.toString());
                     await widget.authRepo.resendVerifyCode(email: widget.email!); 
                  }
                   },
              ),
              const Spacer(flex: 4),
              Center(
                child: CustomButton(
                    onPressed: () {
                      if (validate == true) {
                        BlocProvider.of<OtpCubit>(context).otpVerifyEmail(
                          email: widget.email!,
                          code: code!,
                        );
                      }
                    },
                    text: 'Confirm',
                    colorButton:
                        validate ? kPrimaryColor : kAlternateButtonColor,
                    colorText: validate ? Colors.white : kButtonColor),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
