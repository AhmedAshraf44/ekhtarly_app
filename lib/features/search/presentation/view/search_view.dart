import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/search/presentation/view/custom_search.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Search',
            style: Styles.textStyle20,
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        body: const CustomSearch(),
      ),
    );
  }
}
