import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_text_button.dart';
import 'package:ekhtarly_app/features/authentication/manger/register_cubit/register_cubit.dart';
import 'package:ekhtarly_app/features/authentication/manger/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../../../core/utils/widgets/custom_all_content_text_form_field.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_widget_row_text.dart';
import '../../../../../../core/utils/widgets/input_validation_mixin.dart';

class RegisterBodyDetails extends StatefulWidget with InputValidationMixin {
  const RegisterBodyDetails({super.key});

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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          //showSnackBar(context, 'sucess');
          // GoRouter.of(context).push(AppRouter.kHomeView);
          GoRouter.of(context).push(
            AppRouter.kOtpView,
            extra: email,
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: Styles.textStyle12.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
              //shape:const StadiumBorder()
            ),
          );
          //    showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        //  bool validate = BlocProvider.of<RegisterCubit>(context).validate;
        //  bool obscureText = BlocProvider.of<RegisterCubit>(context).obscureText ;
        //  IconData? suffixIcon = BlocProvider.of<RegisterCubit>(context).suffixIcon;
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          child: SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Register Account !',
                            style: Styles.textStyle28,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Fill your details or continue with  \n social media',
                            style: Styles.textStyle16Smei
                                .copyWith(color: Color(0xff707B81)),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomAllContentTextFormField(
                      validator: (name) {
                        if (name?.isEmpty ?? true) {
                          return 'Name is Required';
                        } else {
                          return null;
                        }
                      },
                      textFormField: 'Enter your full name ',
                      topTextFeild: 'Full Name',
                      colorTopTextFeild:
                          validate ? kSecondaryColor : kBlackColor,
                      onChanged: (value) {
                        name = value;
                        validate = registerFormKey.currentState!.validate();
                        setState(() {});
                      },
                      icon: Icons.person_2_rounded,
                      prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                    ),
                    const SizedBox(
                      height: 8,
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
                        validate = registerFormKey.currentState!.validate();
                        setState(() {});
                      },
                      icon: Icons.email_outlined,
                      prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                    ),
                    const SizedBox(
                      height: 8,
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
                        validate = registerFormKey.currentState!.validate();
                        setState(() {});
                      },
                      icon: Icons.password,
                      prefixIconColor: validate ? kSecondaryColor : kBlackColor,
                      obscureText: obscureText,
                      suffixIcon: suffixIcon,
                      suffixIconColor:
                          obscureText ? kSecondaryColor : kBlackColor,
                      onPressed: () {
                        obscureText = !obscureText;
                        suffixIcon = obscureText
                            ? Icons.visibility
                            : Icons.visibility_off;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Center(
                        child: CustomButton(
                            onPressed: () {
                              setState(() {
                                validate =
                                    registerFormKey.currentState!.validate();
                              });
                              if (registerFormKey.currentState!.validate()) {
                                registerFormKey.currentState!.save();
                                //validate = true;
                                // BlocProvider.of<RegisterCubit>(context).authRepo.registerUser(name: name!, email: email!, password: password!);
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                        name: name!,
                                        email: email!,
                                        password: password!);
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                validate = false;
                              }
                            },
                            text: 'Registration',
                            colorButton: validate
                                ? kPrimaryColor
                                : kAlternateButtonColor,
                            colorText: validate ? Colors.white : kButtonColor)),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: CustomTextButton(
                        onTap: () {},
                        text: 'Sign up with Google',
                        colorText: kBlackColor,
                        colorButton: kAlternateButtonColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.050,
                    ),
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
            ),
          ),
        );
      },
    );
  }
}
