import 'package:ekhtarly_app/features/favourite/presentation/manger/add_favourite_cubit/add_favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_image_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_price_newest_laptops_item.dart';
import '../../../../../core/utils/widgets/custom_tittle_newest_laptops_item.dart';
import '../../../../home/data/model/laptops_image_model.dart';
// 1 
class FavouriteGridViewItem extends StatelessWidget {
  const FavouriteGridViewItem({super.key, required this.laptops,required this.image});
   final Laptops laptops;
  final LaptopsImageModel image;

  @override
  Widget build(BuildContext context) {
    return 
    // Dismissible(
    //   key: UniqueKey(),
    //   onDismissed: (direction) {
    //   //  notes.delete();
    //     BlocProvider.of<FavouriteCubit>(context).deleteToFavourite(id: laptops.id!);
    //      showSnackBar(context, 'The note has been successfully deleted');
    //     BlocProvider.of<FavouriteCubit>(context).displayFavourite();
       
    //   },
      // child: 
      GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kNewestLaptopsView, extra: laptops);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          // color: kAlternateButtonColor,
          // color: Color(0xffF2F5FA),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomImageNewestLaptopsItem(image: image),
            const SizedBox(
              height: 10,
            ),
            // Flexble
            CustomTittleNewestLaptopsItem(
                title: laptops.name.toString()),
            CustomPriceNewestLaptopsItem(onPressed: (){
              BlocProvider.of<FavouriteCubit>(context).deleteToFavourite(id: laptops.id!);
            },iconColor: const Icon(Icons.favorite, color: Colors.red),
              price: laptops.price!.toInt(),
            ),
            // const Spacer(),
          ],
        ),
      ),
      // ),
    );
  }
}