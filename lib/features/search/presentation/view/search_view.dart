import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.close_rounded),
          title: const Text(
            'Search',
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        body: const CustomSearch(),
      ),
    );
  }
}
