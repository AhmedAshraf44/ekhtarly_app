import 'package:ekhtarly_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'custom_featured_text.dart';

class CustomAllContentTextFormField extends StatelessWidget {
  const CustomAllContentTextFormField({
    super.key,
    this.onChanged,
    this.colorTopTextFeild,
    required this.textFormField,
    required this.topTextFeild,
    required this.icon,
    required this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor = kBlackColor,
    this.obscureText = false,
    this.onPressed,
    this.validator,
  });
  final void Function(String)? onChanged;
  final Color? colorTopTextFeild;
  final String textFormField;
  final String topTextFeild;
  final IconData icon;
  final Color prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool obscureText;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFeaturedText(
          text: topTextFeild,
          color: colorTopTextFeild,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          validator: validator,
          text: textFormField,
          onChanged: onChanged,
          prefixIcon: icon,
          prefixIconColor: prefixIconColor,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
