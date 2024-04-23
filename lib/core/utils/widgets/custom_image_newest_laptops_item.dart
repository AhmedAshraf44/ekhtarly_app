import 'package:flutter/material.dart';

class CustomImageNewestLaptopsItem extends StatelessWidget {
  const CustomImageNewestLaptopsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            'assets/images/macbook1.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .15,
          ),
        ),
      ),
    );
  }
}
