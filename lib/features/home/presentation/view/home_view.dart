import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/newest_laptops_cubit/newest_laptops_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/menu.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/profile_body.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:ekhtarly_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../favourite/presentation/manger/add_favourite_cubit/add_favourite_cubit.dart';
import '../../../favourite/presentation/view/favourite_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedTab = 0;

  List screens = [
    const HomeViewBody(),
    const SearchView(),
    const FavouriteView(),
    const AccountProfileBody(),
  ];

  changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  void initState() {
    BlocProvider.of<NewestLaptopsCubit>(context).getNewestLaptops();
    BlocProvider.of<FavouriteCubit>(context).displayFavourite();
    BlocProvider.of<SearchCubit>(context).getPrograms();

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
      Icons.favorite,
      color: kPrimaryColor,
      size: 30,
    )),
    CurvedNavigationBarItem(
        child: Icon(
      Icons.person,
      color: kPrimaryColor,
      size: 30,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
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
      )),
    );
  }
}
