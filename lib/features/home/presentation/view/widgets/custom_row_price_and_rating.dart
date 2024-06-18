import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
import '../../../../../core/utils/styles.dart';

class CustomRowPriceAndRating extends StatelessWidget {
  const CustomRowPriceAndRating({
    super.key,
    required this.laptops,
  });

  final Laptops laptops;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Price:  ',
                      style: Styles.textStyle14.copyWith(color: Colors.white)),
                  Text('EGP ${laptops.price}',
                      style:
                          Styles.textStyle16Smei.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(laptops.specRating!.toStringAsFixed(1),
                      style: Styles.textStyle14.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
