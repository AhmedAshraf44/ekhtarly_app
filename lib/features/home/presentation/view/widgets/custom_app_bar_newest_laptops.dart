import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomAppBarNewestLaptopDetails extends StatefulWidget {
  const CustomAppBarNewestLaptopDetails({super.key,required this.isFavorite});
 final bool? isFavorite;
  @override
  State<CustomAppBarNewestLaptopDetails> createState() =>
      _CustomAppBarNewestLaptopDetailsState();
}

class _CustomAppBarNewestLaptopDetailsState extends State<CustomAppBarNewestLaptopDetails> {
  bool iconColor = false;
 
  @override
  Widget build(BuildContext context) {
   iconColor = widget.isFavorite ?? true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CircleAvatar(
            radius: 25,
            //    backgroundColor:kBackgroundColor,
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            child: IconButton(
              icon:  iconColor 
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: kBlackColor,
                        size: 25,
                      ),
              onPressed:(){
                setState(() {
                  iconColor = !iconColor;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
