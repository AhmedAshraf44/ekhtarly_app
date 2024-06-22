import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTittleNewestLaptopsItem extends StatelessWidget {
  const CustomTittleNewestLaptopsItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.textStyle14,
        ),
      ),
    );
  }
}
