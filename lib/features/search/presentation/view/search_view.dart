import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/search/presentation/view/custom_search.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(),
          title: const Text(
            'Search',
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        body: CustomSearch(),
      ),
    );
  }
}
