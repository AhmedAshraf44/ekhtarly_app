import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:flutter/material.dart';

class CustomNewestLaptopDetailsSlider extends StatelessWidget {
  const CustomNewestLaptopDetailsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: CustomTipsSlider(
        checkPage: false,
      ),
    );
  }
}