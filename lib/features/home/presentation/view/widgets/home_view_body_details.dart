import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/data/model/newest_laptop/newest_laptop_model.dart';
import 'package:flutter/material.dart';
import '../../../data/model/laptops_image_model.dart';
import 'newest_laptops_item.dart';
  

class HomeViewBodyDetails extends StatelessWidget {
  const HomeViewBodyDetails({super.key, required this.newestLaptop});
  final NewestLaptopModel newestLaptop;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: MediaQuery.of(context).size.height * .29,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: newestLaptop.length,
        (context, index) => NewestLaptopsItem(
          laptops: newestLaptop.laptops![index],
           image: imageList[index],
        ),
      ),
    );
  }
}
