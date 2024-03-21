// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../constants.dart';
// import '../../../../../core/utils/app_router.dart';
// import '../../../../../core/utils/styles.dart';
// import '../../../../../core/utils/widgets/custom_all_content_text_form_field.dart';
// import '../../../../../core/utils/widgets/custom_button.dart';
// import 'custom_text_forget_password.dart';

// class ChangeNewPasswordBody extends StatefulWidget {
//   const ChangeNewPasswordBody({super.key});

//   @override
//   State<ChangeNewPasswordBody> createState() => _ChangeNewPasswordBodyState();
// }

// class _ChangeNewPasswordBodyState extends State<ChangeNewPasswordBody> {
//   GlobalKey<FormState> forgetPasswordForm = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   bool validate = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//       ),
//       child: Form(
//         key: forgetPasswordForm,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Spacer(
//               flex: 2,
//             ),
//             CustomTextForgetPassword(
//               text: 'Change New Password',
//               textDetails: validate
//                   ? 'Enter a different password with the previous'
//                   : 'Enter your registered email below',
//               style: validate
//                   ? const TextStyle(
//                       color: Color(0xff828282),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14)
//                   : Styles.textStyle16Regular.copyWith(
//                       color: kSecondaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//             ),
//             const SizedBox(
//               height: 54,
//             ),
//             CustomAllContentTextFormField(
//               textFormField: '**** **** ****',
//               topTextFeild: 'New Password',
//               colorTopTextFeild: kSecondaryColor,
//               onChanged: (p0) {
//                 {
//                   setState(() {
//                     validate = forgetPasswordForm.currentState!.validate();
//                   });
//                 }
//               },
//               icon: Icons.password, prefixIconColor: validate ? kSecondaryColor :kBlackColor,
//                           ),
//             const SizedBox(
//               height: 16,
//             ),
//             CustomAllContentTextFormField(
//               textFormField: '**** **** ****',
//               topTextFeild: 'Confarm Password',
//               colorTopTextFeild: kSecondaryColor,
//               onChanged: (p0) {
//                 {
//                   setState(() {
//                     validate = forgetPasswordForm.currentState!.validate();
//                   });
//                 }
//               },
//               icon: Icons.password, prefixIconColor: validate ? kSecondaryColor : kBlackColor,
//             ),
//             const Spacer(flex: 4),
//             Center(
//               child: CustomButton(
//                   onPressed: () {
//                     if (forgetPasswordForm.currentState!.validate()) {
//                       GoRouter.of(context).push(AppRouter.kSuccessView,);
//                     } else {
//                       setState(() {
//                         validate = false;
//                         autovalidateMode = AutovalidateMode.always;
//                       });
//                     }
//                   },
//                   text: validate ? 'Reset Password' : 'Submit',
//                   colorButton: validate ? kPrimaryColor : kAlternateButtonColor,
//                   colorText: validate ? Colors.white : kButtonColor),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
