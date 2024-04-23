import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_image_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_price_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_tittle_newest_laptops_item.dart';

class FavouriteGridViewItem extends StatelessWidget {
  const FavouriteGridViewItem({super.key, required this.laptops});
   final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kNewestLaptopsView, extra: laptops);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          // color: kAlternateButtonColor,
          // color: Color(0xffF2F5FA),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomImageNewestLaptopsItem(),
            const SizedBox(
              height: 10,
            ),
            // Flexble
            CustomTittleNewestLaptopsItem(
                title: laptops.name.toString()),
            CustomPriceNewestLaptopsItem(iconColor: const Icon(Icons.favorite, color: Colors.red),
              price: laptops.price!,
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}