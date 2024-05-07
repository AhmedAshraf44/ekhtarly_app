import 'package:ekhtarly_app/features/favourite/presentation/view/widgets/favourite_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/add_favourite_cubit/add_favourite_cubit.dart';
import '../../manger/add_favourite_cubit/add_favourite_state.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
      if (state is FavouriteFailure) {
        return Center(child: Text(state.errorMessage));
      } else if (state is DisplayFavourite) {
        return state.favoriteList.favoriteList == null
            ? const Center(
                child: Text('There are no items in your favorites'),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20,),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.favoriteList.favoriteList?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: MediaQuery.of(context).size.height * .27,
                  ),
                  itemBuilder: (context, index) => FavouriteGridViewItem(
                      laptops: state.favoriteList.favoriteList![index]),
                ),
              );
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
