import 'package:ekhtarly_app/features/home/data/model/newest_laptop/newest_laptop_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_sliver_list_item.dart';

class CustomTipsGridView extends StatelessWidget {
  const CustomTipsGridView({super.key, required this.newestLaptop});
final NewestLaptopModel  newestLaptop;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: MediaQuery.of(context).size.height * .27,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: newestLaptop.length,
        (context, index) => CustomSliverListItem(laptops:newestLaptop.laptops![index] ,),
      ),
    );
  }
}
