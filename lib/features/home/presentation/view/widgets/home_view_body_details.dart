import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_sliver_list_item.dart';

class CustomTipsGridView extends StatelessWidget {
  const CustomTipsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
       crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: MediaQuery.of(context).size.height * .27,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 6,
        (context, index) =>const  CustomSliverListItem(),
      ),);
    
  }
}