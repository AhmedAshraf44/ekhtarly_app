import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextSuccess extends StatelessWidget {
  const CustomTextSuccess({super.key, required this.text, this.style=Styles.textStyle16Regular});
final String text;
final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Image.asset('assets/images/Success Icon.png'),
          Text('Success',style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text(text,style:style.copyWith(
            fontWeight: FontWeight.w500,
            color:const Color(0xff6B7280),) ,
            textAlign: TextAlign.center
            ,),
      ],
    );
  }
}