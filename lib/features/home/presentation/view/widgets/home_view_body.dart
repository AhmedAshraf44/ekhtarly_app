import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_search.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body_details.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: CustomAppBar(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: CustomSearch(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Tips For Buying Laptops',style: Styles.textStyle16Smei,),
                ),
                HomeViewBodyDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}