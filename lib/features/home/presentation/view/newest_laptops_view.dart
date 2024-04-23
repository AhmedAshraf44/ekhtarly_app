import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptops_details.dart';
import 'package:flutter/material.dart';

class NewestLaptopsView extends StatelessWidget {
  const NewestLaptopsView({super.key, required this.laptops});
  final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NewestLaptopsDetails(
          laptops: laptops,
        ),
      ),
    );
  }
}

// appBar: AppBar(
//   backgroundColor: Colors.transparent,
//     actions:const [
//     Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: CircleAvatar(
//         radius: 25,
//       //    backgroundColor:kBackgroundColor,
//       backgroundColor: Colors.white,
//           child: IconButton(
//             icon: Icon(
//               Icons.favorite_border,
//               size: 25,
//               color: kBlackColor,
//             ),
//             onPressed: null,
//           ),
//         ),
//     ),
//     ],
// ),
