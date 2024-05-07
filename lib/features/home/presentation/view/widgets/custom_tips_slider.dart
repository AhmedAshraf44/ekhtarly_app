import 'dart:async';

import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/data/model/laptops_image_model.dart';
import 'package:flutter/material.dart';

class CustomTipsSlider extends StatefulWidget {
  const CustomTipsSlider({super.key, required this.checkPage});
  final bool checkPage;
  @override
  State<CustomTipsSlider> createState() => _CustomTipsSliderState();
}

class _CustomTipsSliderState extends State<CustomTipsSlider> {
  late final PageController pageController;

  Timer? carouselTimer;
  List<LaptopsImageModel> laptopsImageList = [
    LaptopsImageModel(image: 'assets/images/macbook1.png'),
    LaptopsImageModel(image: 'assets/images/macbook2.png'),
    LaptopsImageModel(image: 'assets/images/macbook3.png'),
  ];
  int pageNumber = 0;
  getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      // pageNumber == 4
      if (pageNumber > laptopsImageList.length - 1) {
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
          height: 200,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              pageNumber = index;
              setState(() {});
            },
            controller: pageController,
            itemCount: widget.checkPage == true ? 5 : laptopsImageList.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return widget.checkPage == true
                      ? child!
                      : ImagelaptopSlider(
                          laptopsImage: laptopsImageList[index]);
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
                    child: const CustomHomeSlider(),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomPointSlider(
          pageNumber: pageNumber,
          number: widget.checkPage == true ? 5 : laptopsImageList.length,
        ),
      ],
    );
  }
}

class CustomPointSlider extends StatelessWidget {
  const CustomPointSlider({
    super.key,
    required this.pageNumber,
    required this.number,
  });

  final int pageNumber;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        number,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Icon(
            Icons.circle,
            size: 12,
            color:
                pageNumber == index ? kPrimaryColor : const Color(0xff95969D),
            //kAlternateButtonColor,
            //Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

class CustomHomeSlider extends StatelessWidget {
  const CustomHomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:const DecorationImage(image: AssetImage('assets/images/lap4.jpg'), fit: BoxFit.cover,opacity: .5),
          // color: kPrimaryColor, 
          borderRadius: BorderRadius.circular(25),
          ),
          child: Center(child: Text('LLLLLLLLLLLLLLLLLLLLLLLLLLLL',style: Styles.textStyle16Smei.copyWith(color: Colors.white))),
    );
  }
}

class ImagelaptopSlider extends StatelessWidget {
  const ImagelaptopSlider({super.key, required this.laptopsImage});
  final LaptopsImageModel laptopsImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
               
        decoration: const BoxDecoration(
            //color: kBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: AspectRatio(
          aspectRatio: 6 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              laptopsImage.image,
              fit: BoxFit.contain,
              //  height: MediaQuery.of(context).size.height * .15,
            ),
          ),
        ),
      ),
    );
  }
}
