import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:ekhtarly_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

import '../../../favourite/presentation/view/favourite_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedTab = 0;

  List screens = const [
    HomeViewBody(),
    SearchView(),
    HomeViewBody(),
    FavouriteView(),
  ];

  changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

 final items =const <CurvedNavigationBarItem> [
     CurvedNavigationBarItem(
              child: Icon(
            Icons.home,
            color: kPrimaryColor,
            size: 30,
          )),
           CurvedNavigationBarItem(
              child: Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 30,
          )),
           CurvedNavigationBarItem(
              child: Icon(
            Icons.person,
            color: kPrimaryColor,
            size: 30,
          )),
          CurvedNavigationBarItem(
              child: Icon(
            Icons.favorite,
            color: kPrimaryColor,
            size: 30,
          )),
 ];
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        extendBody: true,
      backgroundColor: const Color(0xffE5E5E5),
      body: screens[selectedTab],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.blueAccent.shade100,
        backgroundColor: Colors.transparent,
        height: 60,
        index: selectedTab,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) => changeTab(index),
        items: items,
      ),
    ));
  }
}
