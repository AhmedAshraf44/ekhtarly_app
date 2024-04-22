import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants.dart';
import '../../../features/home/data/model/newest_laptop/laptops.dart';

class CustomSliverListItem extends StatefulWidget {
  const CustomSliverListItem({super.key, required this.laptops,});
  final Laptops laptops;
  @override
  State<CustomSliverListItem> createState() => _CustomSliverListItemState();
}

class _CustomSliverListItemState extends State<CustomSliverListItem> {
  bool iconColor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
      GoRouter.of(context).push(AppRouter.kNewestLaptopsView,extra: widget.laptops);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: kAlternateButtonColor,
         // color: Color(0xffFFFFFF),
         // color: Color(0xffF2F5FA),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  width:double.infinity,
                 // color: Color(0xffF2F5FA),
                  color: Colors.white,
                  //color:kAlternateButtonColor ,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/macbook1.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                  ),
                ),),
            const SizedBox(
              height: 10,
            ),
            // Flexble
             Expanded(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 10, ),
                child: Text(
                  widget.laptops.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Styles.textStyle14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,right: 10,bottom: 10,top: 5,
              ),
              child: Row(
                children: [
                  Text(
                    'EGP ${widget.laptops.price}',
                    style: Styles.textStyle14.copyWith(
                      color: kThridColor,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xffF7F7F9),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          iconColor = !iconColor;
                        });
                      },
                      icon: iconColor
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border, color: kBlackColor),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
