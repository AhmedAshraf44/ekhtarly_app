import 'package:ekhtarly_app/features/favourite/presentation/view/widgets/favourite_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../home/data/model/laptops_image_model.dart';
import '../../manger/add_favourite_cubit/add_favourite_cubit.dart';
import '../../manger/add_favourite_cubit/add_favourite_state.dart';
  
 final List<LaptopsImageModel> imageList = [
    LaptopsImageModel(image: 'assets/images/macbook1.png'),
    LaptopsImageModel(image: 'assets/images/macbook2.png'),
    LaptopsImageModel(image: 'assets/images/macbook3.png'),
    LaptopsImageModel(image: 'assets/images/macbook4.webp'),
    LaptopsImageModel(image: 'assets/images/macbook5.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook6.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook7.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook8.jpeg'),
  ];
class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
      if (state is DeleteFavourite) {
        showSnackBar(context, 'The item has been successfully deleted');
        BlocProvider.of<FavouriteCubit>(context).displayFavourite();
      }
    }, builder: (context, state) {
      if (state is FavouriteFailure) {
        return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)));
      } else if (state is DisplayFavourite) {
        if (state.favoriteList.laptops.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('There are no items in your favorites'),
            ),
          );
        } else {
          return SliverGrid.builder(
            // shrinkWrap: true,
            //physics:const NeverScrollableScrollPhysics(),
            //  physics: const BouncingScrollPhysics(),
            itemCount: state.favoriteList.laptops.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: MediaQuery.of(context).size.height * .29,
            ),
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                BlocProvider.of<FavouriteCubit>(context).deleteToFavourite(
                    id: state.favoriteList.laptops[index].id!);
                // showSnackBar(context, 'The item has been successfully deleted');
                //BlocProvider.of<FavouriteCubit>(context).displayFavourite();
              },
              child: FavouriteGridViewItem(
                  laptops: state.favoriteList.laptops[index],
                  image: imageList[index],
                  ),
              //   ),
              // ),
            ),
          );
        }
      } else {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
