import 'package:flutter/material.dart';

import 'custom_descrption_item_value.dart';

class CustomDescrptionItem extends StatelessWidget {
  const CustomDescrptionItem({
    super.key,
    required this.textValue,
    required this.text,
  });
  final String text;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDescrptionItemValue(
          textValue: text,
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