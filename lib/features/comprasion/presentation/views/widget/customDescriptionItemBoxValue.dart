import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDescrptionItemBoxValue extends StatelessWidget {
  const CustomDescrptionItemBoxValue({
    super.key,
    required this.textValue,
  });
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          child: Center(
            child: Text(
              textValue,
              style: Styles.textStyle15,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
