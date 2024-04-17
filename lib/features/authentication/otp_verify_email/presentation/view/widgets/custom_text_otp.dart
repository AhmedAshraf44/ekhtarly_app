import 'package:ekhtarly_app/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';

class CustomTextOtp extends StatelessWidget {
  const CustomTextOtp({
    super.key,
    required this.text,
    required this.textDetails,
    this.style = Styles.textStyle16Regular,
    required this.targetWord,
  });

  final String text;
  final String textDetails;
  final TextStyle style;
  final String targetWord;
//final Color textColorDetils ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: style,
            children: <TextSpan>[
              TextSpan(text: textDetails.replaceAll(targetWord, '')),
              TextSpan(
                text: targetWord,
                style: style.copyWith(
                    fontWeight: FontWeight.bold, color: kBlackColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
