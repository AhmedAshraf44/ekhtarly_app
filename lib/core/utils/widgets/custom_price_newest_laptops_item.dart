import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomPriceNewestLaptopsItem extends StatelessWidget {
  const CustomPriceNewestLaptopsItem(
      {super.key,
      required this.price,
      this.onPressed,
      required this.iconColor});
  final double price;
  final void Function()? onPressed;
  final Icon iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
        top: 5,
      ),
      child: Row(
        children: [
          Text(
            'EGP ${price.ceil()}',
            style: Styles.textStyle14.copyWith(
              color: kThridColor,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          CircleAvatar(
            backgroundColor: const Color(0xffF7F7F9),
            child: IconButton(
              onPressed: onPressed,
              icon: iconColor,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
