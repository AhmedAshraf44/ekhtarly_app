import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextForgetPassword extends StatelessWidget {
  const CustomTextForgetPassword({super.key, required this.text, required this.textDetails,this.style = Styles.textStyle16Regular,});
 
final String text;
final String textDetails;
final TextStyle style;
//final Color textColorDetils ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
              text,
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textDetails,
              style: style,
            ),
      ],
    );
  }
}