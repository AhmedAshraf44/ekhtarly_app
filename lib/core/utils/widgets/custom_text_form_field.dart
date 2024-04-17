import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/functions/build_border.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.onChanged,
    required this.prefixIcon,
    required this.prefixIconColor,
    this.suffixIcon = Icons.visibility_off,
    this.suffixIconColor,
    required this.obscureText,
    this.onPressed,
    this.validator,
  });
  final String text;
  final void Function(String)? onChanged;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool obscureText;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      // validator: (value) {
      //   if (value?.isEmpty ?? true) {
      //     return 'Feiled is Required';
      //   }else  if (!isEmailValid(value.toString())){
      //    return 'Enter a valid email address';

      //   }else if(!isPasswordValid(value.toString()))
      //   {
      //   return 'Enter a valid password';
      //   }else {
      //    return null;
      //   }
      // },
      // onSaved: (value) {},
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: prefixIconColor,
          suffixIcon: IconButton(onPressed: onPressed, icon: Icon(suffixIcon)),
          suffixIconColor: suffixIconColor,
          hintText: text,
          hintStyle: Styles.textStyle12,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(color: kPrimaryColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: kButtonColor))),
    );
  }
}
