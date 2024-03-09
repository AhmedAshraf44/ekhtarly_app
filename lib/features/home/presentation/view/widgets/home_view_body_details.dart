import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_tips_slider.dart';
import 'package:flutter/material.dart';

class HomeViewBodyDetails extends StatelessWidget {
  const HomeViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: CustomTipsSlider(),
        ),
         Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Text('Newest Laptop',style: Styles.textStyle16Smei,),
                ),
        CustomTipsGridView()
      ],
    );
  }
}

class CustomTipsGridView extends StatelessWidget {
  const CustomTipsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            //color: kSecondaryColor,
            color: kAlternateButtonColor,
           //color: Color(0xffFFFFFF),

            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    'https://wallpapers.com/images/featured/laptop-murjp1nk4lp1idlt.jpg',
                    fit: BoxFit.cover,
                    height: 190,
                  )),
                 const SizedBox(height: 10,),
               const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Expanded(
                    child:  Text('Laptop Wallpapers',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle16Smei,),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 10,
                  vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$ 500',style: Styles.textStyle14.copyWith(
                        color: kThridColor,
                      ),),
                      const Icon(Icons.favorite_border,color:  kThridColor,)
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

// class CustomTipsListView extends StatelessWidget {
//   const CustomTipsListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .16,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return const Padding(
//             padding: EdgeInsets.only(right: 11),
//             child: CustomTipItem(),
//           );
//         },
//       ),
//     );
//   }
// }

// class CustomTipItem extends StatelessWidget {
//   const CustomTipItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/images/Group 3115.png',
//       fit: BoxFit.fill,
//     );
//   }
// }

