import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_app_bar_newest_laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_newest_laptop_details_slider.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_row_price_and_rating.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptop_details_descrption_item.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
import '../../../../../core/utils/styles.dart';

class NewestLaptopsDetails extends StatelessWidget {
  const NewestLaptopsDetails({super.key, required this.laptops});
  final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CustomAppBarNewestLaptopDetails(isFavorite: laptops.isFavorite,),
        const CustomNewestLaptopDetailsSlider(),
        NewestLaptopDetailsDescrption(
          laptops: laptops,
        ),
      ],
    );
  }
}

class NewestLaptopDetailsDescrption extends StatelessWidget {
  const NewestLaptopDetailsDescrption({super.key, required this.laptops});
  final Laptops laptops;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        // topRight: Radius.circular(50),
      ),
      child: Container(
        // color: kBackgroundColor,
        //  color: kAlternateButtonColor,
        color: const Color(0xffF2F5FA),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Text(
                laptops.name!,
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomRowPriceAndRating(laptops: laptops),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Specifications',
                  style:
                      Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
                ),
              ),
              NewestLaptopDetailsDescrptionItem(
                laptops: laptops,
              ),
            ],
          ),
        ),
      ),
    );
  }
}