import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedTab = 0;

  List pages = const [
    HomeViewBody(),
    HomeViewBody(),
    HomeViewBody(),
  ];

  changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:const Color(0xffE5E5E5),
      body: pages[selectedTab],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE5E5E5),
                blurRadius:  10,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xffFFFFFF),
            currentIndex: selectedTab,
            selectedItemColor: kPrimaryColor,
            onTap: (index) => changeTab(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: ''),
              BottomNavigationBarItem(
                  icon:Icon(Icons.search),
                  label: ''),
                 BottomNavigationBarItem(
                  icon:Icon(Icons.person),
                  label: ''),
            ],
          ),
        ),
      ),
    ));
  }
}