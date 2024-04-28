import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/favourite/presentation/view/widgets/favourite_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              Spacer(),
              Text(
                'Favourite',
                style: Styles.textStyle14,
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Color(0xffFFFFFF),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: kBlackColor,
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: FavouriteViewBody()),
      ],
    );
  }
}
