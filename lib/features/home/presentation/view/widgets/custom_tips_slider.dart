import 'dart:async';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view_models/tips_model_view.dart';
import 'package:flutter/material.dart';
import '../../../data/model/tips_model.dart';

class CustomTipsSlider extends StatefulWidget {
  const CustomTipsSlider({super.key});
  @override
  State<CustomTipsSlider> createState() => _CustomTipsSliderState();
}

class _CustomTipsSliderState extends State<CustomTipsSlider> {
  late final PageController pageController;
  final TipsModelView items = TipsModelView();
  Timer? carouselTimer;
  int pageNumber = 0;
  getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      // pageNumber == 4
      if (pageNumber > items.itemTipsList.length - 1) {
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
            itemCount: items.itemTipsList.length,
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
                    child: CustomHomeSlider(
                      itemTips: items.itemTipsList[index],
                      number: items.itemTipsList.length,
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
            color: pageNumber == index
                ? const Color(0xffFFFFFF)
                : const Color(0xff95969D),
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
    required this.itemTips,
    required this.pageNumber,
    required this.number,
  });
  final TipsModel itemTips;
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Center(
                    child: Text(
                  itemTips.textTips,
                  style: Styles.textStyle20.copyWith(
                    color: const Color(0xffFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                )),
              ),
              const SizedBox(
                height: 5,
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
