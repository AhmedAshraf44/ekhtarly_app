import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/data/model/newest_laptop/laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_app_bar_newest_laptops.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
class NewestLaptopsDetails extends StatelessWidget {
  const NewestLaptopsDetails({super.key, required this.laptops});
  final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBarNewestLaptops(),
          CustomImageNewestLaptop(),
          CustomDescrptionNewestLaptop(),
        ],
      ),
    );
  }
}

class CustomImageNewestLaptop extends StatelessWidget {
  const CustomImageNewestLaptop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(30.0),
      child: CustomTipsSlider(
        checkPage: false,
      ),
    );
    //    Container(
    //     decoration: BoxDecoration(
    //     color: Colors.white,),
    //     child: Image.asset('assets/images/macbook1.png')),
    // );
  }
}

class CustomDescrptionNewestLaptop extends StatelessWidget {
  const CustomDescrptionNewestLaptop({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        // color: kBackgroundColor,
         color: kAlternateButtonColor,
       // color: Color(0xffF2F5FA),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                'MacBook Pro 14 inch Laptop',
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Apple',
                        style: Styles.textStyle12.copyWith(color: kThridColor)),
                    Text('rating: 2.7',
                        style: Styles.textStyle12.copyWith(color: kThridColor)),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomDescrptionNewestLaptopitem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class CustomDescrptionNewestLaptopitem extends StatelessWidget {
  const CustomDescrptionNewestLaptopitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications',
          style: Styles.googleFontsPoppins.copyWith(color: kPrimaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                   border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child:const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('name'),
                  ],
                ),
              ),
            ),
           const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MacBook Pro 14 inch Laptop'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('brand'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Apple'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('price'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('50000'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('processor'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Apple M2 Max M2 Max'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CPU'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('12 Cores'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ram'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('22GB'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ram Type'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Unified'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ROM'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1TB'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ROM Type'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SSD'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('GPU'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('80-core GPU'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('display Size'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('14.2'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('OS'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mac OS'),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('type'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('graphics'),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
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
