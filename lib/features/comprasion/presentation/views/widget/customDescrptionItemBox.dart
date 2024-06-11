import 'package:ekhtarly_app/features/comprasion/presentation/views/widget/customDescriptionItemBoxValue.dart';
import 'package:flutter/material.dart';

class CustomDescrptionItemBox extends StatelessWidget {
  CustomDescrptionItemBox({
    super.key,
    required this.textValue,
    this.text,  this.secand=false,
  });
  String? text;
  final String textValue;
  final bool secand ;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        secand 
            ? Container()
            : CustomDescrptionItemBoxValue(
                textValue: text!,
              ),
        const SizedBox(
          width: 15,
        ),
        CustomDescrptionItemBoxValue(
          textValue: textValue,
        ),
      ],
    );
  }
}
