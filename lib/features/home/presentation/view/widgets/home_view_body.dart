import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_search.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 20,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xffE5E5E5),
            leading:const Icon(Icons.menu),
            actions: const [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
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
            // floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomSearch(
              //  keyboardType: TextInputType.none,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSearchView);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tips For Buying Laptops',
                    style: Styles.googleFontsPoppins,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      //right: 10,
                      // left: 10,
                      top: 20,
                      bottom: 62,
                    ),
                    child: CustomTipsSlider(),
                  ),
                  Text('Newest Laptop', style: Styles.googleFontsPoppins),
                  //  HomeViewBodyDetails(),
                ],
              ),
            ),
          ),
          const CustomTipsGridView(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 75,
            ),
          )
        ],
      ),
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