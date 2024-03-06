import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'custom_featured_text.dart';

class CustomWidgetRowText extends StatelessWidget {
  const CustomWidgetRowText({super.key, this.onTap, required this.text, required this.textColor, required this.featureText,this.mainAxisAlignment = MainAxisAlignment.start});

  final void Function()? onTap;
  final String text;
  final Color textColor; 
  final String featureText;
  final  MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment:mainAxisAlignment,
            children: [
              CustomFeaturedText(text: text,color:textColor ,
             rightPadding: 2,
             ),
               CustomFeaturedText(
                rightPadding: 0,
                leftPadding: 0,
                text: featureText, color: kPrimaryColor,
                onTap:onTap,
                ),
            ],
          );
  }
}