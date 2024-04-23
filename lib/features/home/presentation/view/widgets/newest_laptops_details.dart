import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_app_bar_newest_laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_newest_laptop_details_slider.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_row_rrice_and_rating.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptop_details_descrption_item.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class NewestLaptopsDetails extends StatelessWidget {
  const NewestLaptopsDetails({super.key, required this.laptops});
  final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const CustomAppBarNewestLaptopDetails(),
        const CustomNewestLaptopDetailsSlider(),
        NewestLaptopDetailsDescrption(
          laptops: laptops,
        ),
      ],
    );
  }
}

class NewestLaptopDetailsDescrption extends StatelessWidget {
  const NewestLaptopDetailsDescrption({super.key, required this.laptops});
  final Laptops laptops;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        // topRight: Radius.circular(50),
      ),
      child: Container(
        // color: kBackgroundColor,
        //  color: kAlternateButtonColor,
        color: const Color(0xffF2F5FA),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Text(
                laptops.name!,
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomRowPriceAndRating(laptops: laptops),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Specifications',
                  style:
                      Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
                ),
              ),
              NewestLaptopDetailsDescrptionItem(
                laptops: laptops,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomDescrptionNewestLaptop extends StatelessWidget {
//   const CustomDescrptionNewestLaptop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//     // ListTile(
//     //   onTap: ()
//     //   {
//     //     // return custom();
//     //      DataTable(
//     //   columns: [
//     //   DataColumn(
//     //     label: Text(
//     //       'Specifications',
//     //       style: Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
//     //     ),
//     //   ),
//     //   DataColumn(label: Text('Value'))
//     // ], rows: const [
//     //   DataRow(selected: true, cells: [
//     //     DataCell(Text('GPU')),
//     //     DataCell(Text('80-core GPU')),
//     //   ]),
//     //   DataRow(cells: [
//     //     DataCell(Text('GPU')),
//     //     DataCell(Text('80-core GPU')),
//     //   ]),
//     //   DataRow(selected: true, cells: [
//     //     DataCell(Text('GPU')),
//     //     DataCell(Text('80-core GPU')),
//     //   ]),
//     // ]);
//     //   },
//     // leading: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
//     // title:  Text(
//     //       'Specifications',
//     //       style: Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
//     //     ),
//     // );

//     DataTable(
//       showCheckboxColumn: false,
//       showBottomBorder: true,

//       border: TableBorder.symmetric(inside: BorderSide(width: .2),),
//       columns: [
//       DataColumn(
//         label: Text(
//           'Specifications',
//           style: Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
//         ),
//       ),
//       DataColumn(label: Text('Value'))
//     ], rows: const [
//       DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow( cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow( cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//     ]);
//   }
// }

// class custom extends StatelessWidget {
//   const custom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  DataTable(
//       //showBottomBorder: true,
//       columns: [
//       DataColumn(
//         label: Text(
//           'Specifications',
//           style: Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
//         ),
//       ),
//       DataColumn(label: Text('Value'))
//     ], rows: const [
//       DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow( cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow( cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//        DataRow(selected: true, cells: [
//         DataCell(Text('GPU')),
//         DataCell(Text('80-core GPU')),
//       ]),
//     ]);
//   }
// }

// image
// class CustomImageNewestLaptop extends StatelessWidget {
//   const CustomImageNewestLaptop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(15)),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'MacBook Pro 14 inch Laptop',
//                 style: Styles.textStyle20,
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text('Apple',
//                   style: Styles.textStyle12.copyWith(color: kThridColor)),
//               SizedBox(
//                 height: 15,
//               ),
//               CustomTipsSlider(
//                 checkPage: false,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Text('rating: 2.7',
//                   style: Styles.textStyle12.copyWith(color: kThridColor)),
//             ],
//           ),
//         ));
//   }
// }
