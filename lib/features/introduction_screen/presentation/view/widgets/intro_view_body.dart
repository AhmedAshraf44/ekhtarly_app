import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/introduction_screen/presentation/view/widgets/arrow_icon.dart';
import 'package:ekhtarly_app/features/introduction_screen/presentation/view/widgets/intro_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../../core/utils/app_router.dart';

class IntroductionViewBody extends StatelessWidget {
  const IntroductionViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      scrollPhysics: const BouncingScrollPhysics(),
      pages: IntroPages.pages,
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: Styles.textStyle16Regular,
      ),
      done: const ArrowIcon(),
      next: const ArrowIcon(),
      onSkip: () {
        GoRouter.of(context).pushReplacement(
          AppRouter.kLoginView,
        );
      },
      onDone: () {
        GoRouter.of(context).pushReplacement(
          AppRouter.kLoginView,
        );
      },
      dotsDecorator: DotsDecorator(
        spacing: const EdgeInsets.all(4),
        size: const Size.square(10.0),
        color: const Color(0xffE6E6E6),
        activeSize: const Size(10.0, 10.0),
        activeColor: kPrimaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
