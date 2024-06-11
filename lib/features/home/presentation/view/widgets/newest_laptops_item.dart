import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_image_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_price_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_tittle_newest_laptops_item.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
import '../../../../favourite/presentation/manger/add_favourite_cubit/add_favourite_cubit.dart';

class NewestLaptopsItem extends StatefulWidget {
  const NewestLaptopsItem({
    super.key,
    required this.laptops,
  });
  final Laptops laptops;
  @override
  State<NewestLaptopsItem> createState() => _NewestLaptopsItemState();
}

class _NewestLaptopsItemState extends State<NewestLaptopsItem> {
  bool iconColor = false;
  @override
  Widget build(BuildContext context) {
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
            const CustomImageNewestLaptopsItem(),
            const SizedBox(
              height: 10,
            ),
            // Flexble
            CustomTittleNewestLaptopsItem(
                title: widget.laptops.name.toString()),
            CustomPriceNewestLaptopsItem(
              price: widget.laptops.price!,
              onPressed: () {
               BlocProvider.of<FavouriteCubit>(context).addToFavorites(id:widget.laptops.id!);
                setState(() {
                  iconColor = !iconColor;
                });
              },
              iconColor: iconColor ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border, color: kBlackColor),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
