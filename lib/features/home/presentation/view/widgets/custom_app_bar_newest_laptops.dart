import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomAppBarNewestLaptops extends StatelessWidget {
  const CustomAppBarNewestLaptops({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon:const Icon(Icons.arrow_back) ,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
           CircleAvatar(
                radius: 25,
              //    backgroundColor:kBackgroundColor,
              backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: kBlackColor,
                    ),
                    onPressed: null,
                  ),
                ),
        ],
      ),
    );
  }
}