import 'dart:async';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/model/laptops_image_model.dart';

class CustomNewestLaptopDetailsSlider extends StatelessWidget {
  const CustomNewestLaptopDetailsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: CustomLaptopsSlider(),
    );
  }
}

class CustomLaptopsSlider extends StatefulWidget {
  const CustomLaptopsSlider({super.key});

  @override
  State<CustomLaptopsSlider> createState() => _CustomLaptopsSliderState();
}

class _CustomLaptopsSliderState extends State<CustomLaptopsSlider> {
  late final PageController pageController;
  //final TipsModelView items = TipsModelView();
  List<LaptopsImageModel> items = [
    //  LaptopsImageModel(image: 'assets/images/l2.webp'),
    LaptopsImageModel(image: 'assets/images/l3.jpeg'),
    LaptopsImageModel(image: 'assets/images/l5.jpeg'),
    LaptopsImageModel(image: 'assets/images/l7.jpg'),
    // LaptopsImageModel(image: 'assets/images/l17.jpeg'),
  ];
  Timer? carouselTimer;
  int pageNumber = 0;
  getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      // pageNumber == 4
      if (pageNumber > items.length - 1) {
        pageNumber = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          pageNumber,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
        pageNumber++;
      }
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
          height: 240,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              pageNumber = index;
              setState(() {});
            },
            controller: pageController,
            itemCount: items.length,
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
                    child: CustomDetailsSlider(
                      itemTips: items[index],
                      number: items.length,
                      pageNumber: pageNumber,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomDetailsSlider extends StatelessWidget {
  const CustomDetailsSlider({
    super.key,
    required this.itemTips,
    required this.pageNumber,
    required this.number,
  });
  final LaptopsImageModel itemTips;
  final int pageNumber;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(itemTips.image),
          fit: BoxFit.cover,
        ),
        //color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: AspectRatio(
        aspectRatio: 4 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              const Spacer(
                flex: 1,
              ),
              CustomPointSlider(
                pageNumber: pageNumber,
                number: number,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
