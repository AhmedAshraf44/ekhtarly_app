import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_search.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body_details.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xffE5E5E5),
          leading:const Padding(
            padding:  EdgeInsets.only(left: 20),
            child:  Icon(Icons.menu),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
              ),
            )
          ],
          title: Row(
            children: [
             const Spacer(),
              Text('E',
                  style: Styles.textStyle20.copyWith(color: Colors.red)),
              Text(' k',
                  style: Styles.textStyle20.copyWith(color: Colors.blue)),
              Text(' h',
                  style: Styles.textStyle20.copyWith(color: Colors.yellow)),
              Text(' t',
                  style: Styles.textStyle20.copyWith(color: Colors.green)),
              Text(' a',
                  style: Styles.textStyle20.copyWith(color: Colors.red)),
              Text(' r',
                  style: Styles.textStyle20.copyWith(color: Colors.blue)),
              Text(' l',
                  style: Styles.textStyle20.copyWith(color: Colors.yellow)),
              Text(' y ',
                  style: Styles.textStyle20.copyWith(color: Colors.green)),
             const Spacer(),
            ],
          ),
          pinned: true,
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: CustomSearch(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tips For Buying Laptops',
                    style: Styles.textStyle16Smei,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 20,
                    bottom: 30,
                  ),
                  child: CustomTipsSlider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'Newest Laptop',
                    style: Styles.textStyle16Smei,
                  ),
                ),
                //  HomeViewBodyDetails(),
              ],
            ),
          ),
        ),
        const CustomTipsGridView(),
      ],
    );
  }
}

            //floating: true,
            //  expandedHeight: 150,
            //   flexibleSpace: FlexibleSpaceBar(
            //     title:  Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            //   child: CustomSearch(),
            // ),
            //   ),
      //  const SliverToBoxAdapter(
      //       child: Padding(
      //     padding: EdgeInsets.only(
      //       right: 20,
      //       left: 20,
      //       bottom: 40,
      //       ),
      //     child: CustomTipsGridView(),
      //   )),

                //   SliverToBoxAdapter(
          //     child:  Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          //     child: CustomAppBar(),
          //   ),
          //   ),