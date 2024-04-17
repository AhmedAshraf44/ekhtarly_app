import 'package:ekhtarly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.colorButton,
      required this.colorText});

  final void Function()? onPressed;
  final String text;
  final Color colorButton;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeightButton,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: colorText, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
