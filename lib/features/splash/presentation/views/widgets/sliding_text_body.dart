import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingTextBody extends StatelessWidget {
  const SlidingTextBody({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(' E', style: Styles.splashtext.copyWith(color: Colors.red)),
            Text('k', style: Styles.splashtext.copyWith(color: Colors.blue)),
            Text('h', style: Styles.splashtext.copyWith(color: Colors.yellow)),
            Text('t', style: Styles.splashtext.copyWith(color: Colors.green)),
            Text('a', style: Styles.splashtext.copyWith(color: Colors.red)),
            Text('r', style: Styles.splashtext.copyWith(color: Colors.blue)),
            Text('l', style: Styles.splashtext.copyWith(color: Colors.yellow)),
            Text('y ', style: Styles.splashtext.copyWith(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
