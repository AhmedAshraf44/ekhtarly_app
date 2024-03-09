import 'dart:async';

import 'package:ekhtarly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTipsSlider extends StatefulWidget {
  const CustomTipsSlider({super.key});

  @override
  State<CustomTipsSlider> createState() => _CustomTipsSliderState();
}

class _CustomTipsSliderState extends State<CustomTipsSlider> {
  late final PageController pageController;
  int pageNumber = 0;

  Timer? carouselTimer;

  getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      // pageNumber == 4
      if (pageNumber == 4) {
        pageNumber = 0;
      }
      pageController.animateToPage(
        pageNumber,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNumber++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: .93);
    carouselTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              pageNumber = index;
              setState(() {
              });
            },
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return child!;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onPanDown: (d) {
                      carouselTimer?.cancel();
                      carouselTimer = null;
                    },
                    onPanCancel: () {
                      carouselTimer = getTimer();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: pageNumber == index
                      ? kPrimaryColor
                      : const Color(0xffFFFFFF),
                      //kAlternateButtonColor,
                      //Colors.grey.shade300,
                ),
              ),
            )),
      ],
    );
  }
}