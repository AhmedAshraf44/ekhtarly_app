import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/view_model/cubit/comprasion_cubit.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/views/widget/comprasionDetails.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptops_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/model/laptops_image_model.dart';

class ComprasionView extends StatelessWidget {
   ComprasionView({super.key});

   final List<LaptopsImageModel> imageList = [
    LaptopsImageModel(image: 'assets/images/macbook1.png'),
    LaptopsImageModel(image: 'assets/images/macbook2.png'),
    LaptopsImageModel(image: 'assets/images/macbook3.png'),
    LaptopsImageModel(image: 'assets/images/macbook4.webp'),
    LaptopsImageModel(image: 'assets/images/macbook5.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook6.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook7.jpeg'),
    LaptopsImageModel(image: 'assets/images/macbook8.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    List<Laptops> laps =
        BlocProvider.of<ComprasionCubit>(context).comparsionItem;
    BlocProvider.of<ComprasionCubit>(context).doComprasion();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Comparison',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: laps.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2 / 2.8),
                  itemBuilder: (context, index) => NewestLaptopsItem(
                    image:imageList[index] ,
                    laptops: laps[index],
                  ),
                )),
            BlocBuilder<ComprasionCubit, ComprasionState>(
              builder: (context, state) {
                if (state is ComprasionInitial) {
                  return Container();
                } else if (state is ComprasionSuccess) {
                  return ComprasionDetails(
                    laptops: state.laps,
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
