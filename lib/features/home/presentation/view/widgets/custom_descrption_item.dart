import 'package:flutter/material.dart';

import 'custom_descrption_item_value.dart';

class CustomDescrptionItem extends StatelessWidget {
  CustomDescrptionItem({
    super.key,
    required this.textValue,
     this.text,
  });
  String? text;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text == null
            ? Container()
            : CustomDescrptionItemValue(
                textValue: text!,
              ),
        const SizedBox(
          width: 15,
        ),
        CustomDescrptionItemValue(
          flex: 2,
          textValue: textValue,
        ),
      ],
    );
  }
}
