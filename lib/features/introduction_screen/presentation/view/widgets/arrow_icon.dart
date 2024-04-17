import 'package:ekhtarly_app/constants.dart';
import 'package:flutter/material.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_forward,
      color: kPrimaryColor,
    );
  }
}
