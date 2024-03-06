import 'package:ekhtarly_app/features/introduction_screen/presentation/view/widgets/intro_view_body.dart';
import 'package:flutter/material.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: IntroductionViewBody(), 
    );
  }
}