import 'package:dio/dio.dart';
import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repositert_implementation.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/get_laptops/get_laptops_cubit.dart';
import 'package:ekhtarly_app/features/search/presentation/view/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        body: BlocProvider(
          create: (context) =>
              GetLaptopsCubit(SearchImpl(apiService: ApiService(Dio()))),
          child: CustomSearch(),
        ),
      ),
    );
  }
}
