import 'package:flutter/material.dart';

import '../../../features/home/data/model/laptops_image_model.dart';
class CustomImageNewestLaptopsItem extends StatelessWidget {
  const CustomImageNewestLaptopsItem({
    super.key, required this.image,
  });

   final LaptopsImageModel image ;
   //= LaptopImageModelView();

  //  String? imagePath;

  @override
  Widget build(BuildContext context) {
    //  image.imageList.shuffle();
    //  imagePath = image.imageList[0].image;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        // color: Color(0xffF2F5FA),
        color: Colors.white,
        //color:kAlternateButtonColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
        image.image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .15,
          ),
        ),
      ),
    );
  }
}
