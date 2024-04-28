import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.colorButton,
      required this.colorText});

  final void Function()? onTap;
  final String text;
  final Color colorButton;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, kHeightButton),
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_google.png',
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            text,
            style: Styles.textStyle14.copyWith(
              color: colorText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
