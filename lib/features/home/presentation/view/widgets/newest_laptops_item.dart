import 'dart:developer';

import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/features/favourite/presentation/manger/add_favourite_cubit/add_favourite_state.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/newest_laptops_cubit/newest_laptops_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_image_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_price_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_tittle_newest_laptops_item.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
import '../../../../favourite/presentation/manger/add_favourite_cubit/add_favourite_cubit.dart';
import '../../../data/model/laptops_image_model.dart';

class NewestLaptopsItem extends StatefulWidget {
  const NewestLaptopsItem({
    super.key,
    required this.laptops,
    required this.image,
  });
  final Laptops laptops;
  final LaptopsImageModel image;

  @override
  State<NewestLaptopsItem> createState() => _NewestLaptopsItemState();
}

class _NewestLaptopsItemState extends State<NewestLaptopsItem> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    value = widget.laptops.isFavorite ?? false;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kNewestLaptopsView, extra: widget.laptops);
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
            CustomImageNewestLaptopsItem(
              image: widget.image,
            ),
            const SizedBox(
              height: 8,
            ),
            // Flexble
            CustomTittleNewestLaptopsItem(
                title: widget.laptops.name.toString()),
            BlocListener<FavouriteCubit, FavouriteState>(
              listener: (context, state) {
                if (state is AddFavourite) {
                  value = true;
                  BlocProvider.of<NewestLaptopsCubit>(context)
                      .getNewestLaptops();
                } else if (state is DeleteFavourite) {
                  value = false;
                  BlocProvider.of<NewestLaptopsCubit>(context)
                      .getNewestLaptops();
                }
              },
              child: CustomPriceNewestLaptopsItem(
                price: widget.laptops.price!,
                onPressed: () {
                  if (widget.laptops.isFavorite! == false) {
                    BlocProvider.of<FavouriteCubit>(context)
                        .addToFavorites(id: widget.laptops.id!);
                    // showSnackBar(context, "Added Successfuly");
                    setState(() {
                      value = true;
                    });
                    log("value : $value");
                    //  BlocProvider.of<FavouriteCubit>(context).displayFavourite();
                  } else {
                    BlocProvider.of<FavouriteCubit>(context)
                        .deleteToFavourite(id: widget.laptops.id!);
                    // showSnackBar(context, "Removed Successfuly");
                    setState(() {
                      value = false;
                    });
                    log("value : $value");
                    //  BlocProvider.of<FavouriteCubit>(context).displayFavourite();
                  }
                },
                iconColor: value == true
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: kBlackColor),
              ),
            ),

            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
