import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/functions/show_snack_bar.dart';
import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/widgets/custom_button.dart';
import 'package:ekhtarly_app/features/authentication/login/presentation/view/login_view.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/change_password/change_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePassowrd extends StatefulWidget {
  ChangePassowrd({super.key});

  @override
  State<ChangePassowrd> createState() => _ChangePassowrdState();
}

class _ChangePassowrdState extends State<ChangePassowrd> {
  String? old;

  String? newpassword1;

  String? newpassword2;
  bool isloading = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change Password'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                        radius: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      'Current Password',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff707B81),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CutsomTextFormField(
                      text: '********',
                      onChanged: (value) {
                        old = value;
                        setState(() {});
                      },
                      isChecker: false,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'New Password',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff707B81),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CutsomTextFormField(
                      text: '********',
                      isChecker: true,
                      onChanged: (value) {
                        newpassword1 = value;
                        setState(() {});
                      },
                      valdiator: (value) {
                        if (old == null) {
                          return 'fill current password pls';
                        }
                        if (value == old) {
                          return 'Password Must be Different';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'New Password Again',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff707B81),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CutsomTextFormField(
                        text: '********',
                        onChanged: (value) {
                          newpassword2 = value;
                        },
                        isChecker: true,
                        valdiator: (value) {
                          if (newpassword1 == null) {
                            return 'fill New Password pls';
                          } else if (value != newpassword1) {
                            return 'password dont match';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocListener<ChangePasswordCubit, ChangePasswordState>(
                      listener: (context, state) {
                        if (state is ChangePasswordSuccess) {
                          isloading = false;
                          setState(() {});
                          showCustomDialoge(context,
                              title: 'Success',
                              content: state.message, onpresed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          }, textbutton: 'Sign in');
                        } else if (state is ChangePasswordfailure) {
                          isloading = false;
                          setState(() {});
                          showCustomDialoge(context,
                              title: 'Fail',
                              content: state.message, onpresed: () {
                            Navigator.of(context).pop();
                          }, textbutton: 'Try again');
                        } else {}
                      },
                      child: CustomButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            try {
                              isloading = true;
                              setState(() {});
                              Map<String, String> body = {
                                'old': old!,
                                'password': newpassword2!
                              };
                              BlocProvider.of<ChangePasswordCubit>(context)
                                  .changepassword(body);
                            } catch (e) {
                              e.toString();
                            }
                          }
                        },
                        colorButton: kButtonColor,
                        colorText: Colors.white,
                        text: 'Save Now',
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showCustomDialoge(BuildContext context,
      {String? content,
      String? title,
      String? textbutton,
      void Function()? onpresed}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ''),
          content: Text(content ?? ""),
          actions: [
            MaterialButton(
              onPressed: onpresed,
              child: Text(
                textbutton ?? "",
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        );
      },
    );
  }
}

class CutsomTextFormField extends StatelessWidget {
  const CutsomTextFormField(
      {super.key,
      required this.text,
      this.onChanged,
      required this.isChecker,
      this.valdiator});
  final String text;
  final bool isChecker;
  final void Function(String)? onChanged;
  final String? Function(String?)? valdiator;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: valdiator,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Color(0xff2B2B2B).withOpacity(0.8)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            fillColor: Color(0xffF7F7F9),
            filled: true),
      ),
    );
  }
}
