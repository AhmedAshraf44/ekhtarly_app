import 'dart:ffi';

import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomSliverListItem extends StatefulWidget {
  const CustomSliverListItem({super.key});

  @override
  State<CustomSliverListItem> createState() => _CustomSliverListItemState();
}

class _CustomSliverListItemState extends State<CustomSliverListItem> {
 bool iconColor = false ;
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: const BoxDecoration(
           // color: kAlternateButtonColor,
           color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    'https://images.pexels.com/photos/18105/pexels-photo.jpg?cs=srgb&dl=pexels-karsten-madsen-18105.jpg&fm=jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .15,
                  )),
                 const SizedBox(height: 10,),
              const Flexible(
                 child:  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text('Laptop Wallpapers',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle14,),
                  ),
               ),
               
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Text(r'$ 500',style: Styles.textStyle14.copyWith(
                        color: kThridColor,
                      ),),
                      const Spacer(flex: 4,),
                       CircleAvatar(
                        backgroundColor:const Color(0xffF7F7F9),
                         child: IconButton(
                          onPressed: (){
                         setState(() {
                          iconColor = !iconColor ;
                         });
                          },
                          icon:iconColor?const Icon(Icons.favorite,color: Colors.red) :const Icon(Icons.favorite_border,color:kBlackColor),
                           
                         ),
                       ),
                      const Spacer(),
                    ],
                  ),
                ),
              // const Spacer(),
            ],
          ),
        );
  }
}