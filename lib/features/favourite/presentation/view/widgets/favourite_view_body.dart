import 'package:ekhtarly_app/core/utils/widgets/custom_sliver_list_item.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
         crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: MediaQuery.of(context).size.height * .27,
        ),
       itemBuilder: (context, index) =>const CustomSliverListItem(), ),
    );
   
  }
}

