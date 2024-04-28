import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('E', style: Styles.textStyle20.copyWith(color: Colors.red)),
        Text('k', style: Styles.textStyle20.copyWith(color: Colors.blue)),
        Text('h', style: Styles.textStyle20.copyWith(color: Colors.yellow)),
        Text('t', style: Styles.textStyle20.copyWith(color: Colors.green)),
        Text('a', style: Styles.textStyle20.copyWith(color: Colors.red)),
        Text('r', style: Styles.textStyle20.copyWith(color: Colors.blue)),
        Text('l', style: Styles.textStyle20.copyWith(color: Colors.yellow)),
        Text('y ', style: Styles.textStyle20.copyWith(color: Colors.green)),
        const Spacer(),
        const Icon(Icons.menu),
      ],
    );
  }
}
