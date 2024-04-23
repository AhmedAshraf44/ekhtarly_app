import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomDescrptionItemValue extends StatelessWidget {
  const CustomDescrptionItemValue({
    super.key,
    this.flex = 1,
    required this.textValue,
  });
  final int flex;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 1.5,
                color: kPrimaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Center(child: Text(textValue,style: Styles.textStyle15,textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,),),
        ),
      ),
    );
  }
}