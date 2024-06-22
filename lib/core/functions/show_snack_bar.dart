import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {double bottom = 0, double top = 0}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: EdgeInsets.only(bottom: bottom, top: top),
        child: Text(
          message,
          style: Styles.textStyle12.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: kPrimaryColor,
      //shape:const StadiumBorder()
    ),
  );
}
