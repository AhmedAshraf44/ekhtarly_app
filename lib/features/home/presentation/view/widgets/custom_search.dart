import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/functions/build_border.dart';
import '../../../../../core/utils/styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
//final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.none,
      onTap: onTap,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 27, right: 5),
            child: Icon(Icons.search),
          ),
          prefixIconColor: kSecondaryColor,
          hintText: 'Search',
          hintStyle: Styles.textStyle12.copyWith(
            color: kSecondaryColor,
          ),
          border: buildBorder(color: const Color(0xffE6E7E9), borderRadius: 15),
          enabledBorder:
              buildBorder(color: const Color(0xffE6E7E9), borderRadius: 15),
          focusedBorder: buildBorder(color: kPrimaryColor, borderRadius: 15),
          filled: true,
          fillColor: kAlternateButtonColor
          // const Color(0xffE6E7E9),
          ),
    );
  }
}
