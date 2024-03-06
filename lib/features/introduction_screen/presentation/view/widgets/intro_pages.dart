import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../../constants.dart';

class IntroPages {
//var viewModel =ViewModel(image:'assets/images/intro_screen/Job hunt-amico 1.png',text: 'Search Your Laptop',textBody:  'The system has a search functionality that enables users to find device by entering keywords',);
    static List<PageViewModel> pages = [
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
      body:
          'The system has a search functionality that enables users to find device by entering keywords',
      titleWidget: Text(
        'Search Your Laptop',
        style: Styles.textStyle28.copyWith(
           color: kBlackColor ,
        ),
      ),
      image: Image.asset(
        'assets/images/intro_screen/Job hunt-amico 1.png',
      ),
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
      body:
          'Describes the customer\'s process of comparing devices with each other to choose from. ',
      titleWidget:  Text(
        'Compare Devices',
        style: Styles.textStyle28.copyWith(
           color:kBlackColor,
        ),
      ),
      image: Image.asset(
        'assets/images/intro_screen/Browser stats-amico 1.png',
      ),
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
      body: 'The system allows users to add selected products to their Favorite list, which will store the chosen items.',
      titleWidget:  Text(
        'Add To Favorites Card',
        style: Styles.textStyle28.copyWith(
           color:kBlackColor,
        ),
      ),
      image: Image.asset(
        'assets/images/intro_screen/Resume-amico 1.png',
      ),
    ),
   
  ];

}

