import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/newest_laptops_cubit/newest_laptops_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/manger/newest_laptops_cubit/newest_laptops_state.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_search.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/home_view_body_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
 @override
  void initState() {
    BlocProvider.of<NewestLaptopsCubit>(context).getNewestLaptops();
   super.initState();
  }
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
            leading: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu)),
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
                      top: 20,
                      bottom: 30,
                    ),
                    child: CustomTipsSlider(
                    ),
                  ),
                  Text('Newest Laptop', style: Styles.googleFontsPoppins),
                  //  HomeViewBodyDetails(),
                ],
              ),
            ),
          ),
          // make in bloc
          BlocBuilder<NewestLaptopsCubit, NewestLaptopsState>(
            builder: (context, state) {
              if (state is NewestLaptopsFailure) {
                return SliverToBoxAdapter(
                    child: Center(
                  child: Text(state.errorMessage),
                ));
              } else if (state is NewestLaptopsSuccess) {
                return HomeViewBodyDetails(
                  newestLaptop: state.laptops,
                );
              } else {
                return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          ),

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
