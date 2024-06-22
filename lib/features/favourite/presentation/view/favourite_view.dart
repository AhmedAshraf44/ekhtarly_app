import 'package:ekhtarly_app/features/favourite/presentation/view/widgets/favourite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../manger/add_favourite_cubit/add_favourite_cubit.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context).displayFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Favourite',
                    style: Styles.textStyle20,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Color(0xffFFFFFF),
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Expanded(child: FavouriteViewBody()),
          FavouriteViewBody(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 75,
            ),
          )
        ],
      ),
    );
  }
}
