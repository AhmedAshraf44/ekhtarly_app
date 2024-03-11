import 'package:ekhtarly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const TextStyle splashtext = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  static const textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const textStyle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: kButtonColor,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const textStyle16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: kButtonColor,
  );

  static const textStyle16Smei = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xff1F2937),
  );

  static const textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static final googleFontsPoppins = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: const Color(0xff0D0D26),
  );
}
