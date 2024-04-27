import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/favourite/manger/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:ekhtarly_app/features/home/manger/newest_laptops_cubit/newest_laptops_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/menu.dart';
import 'package:ekhtarly_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    BlocProvider.of<NewestLaptopsCubit>(context).getNewestLaptops();
    BlocProvider.of<FavouriteCubit>(context).getFavorites();
    super.initState();
  }

  final items = const <CurvedNavigationBarItem>[
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
      drawer: MyDrawer(),
      backgroundColor: kBackgroundColor,
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
