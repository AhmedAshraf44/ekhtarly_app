import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/functions/build_border.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptops_item.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/get_laptops/get_laptops_cubit.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    super.key,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  var selecting = <ProgramModel>{};
  double sliderValue = 20000;
  @override
  late double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  return searchBar(state);
                } else if (state is SearchFaluire) {
                  return const Text('There Was An Problem');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            selecting.isEmpty
                ? const Center(child: Text('No Selected Program'))
                : wrapping(),
            const SizedBox(
              height: 20,
            ),
            slider(),
            Text.rich(TextSpan(children: [
              const TextSpan(text: 'Your Budget : ', style: Styles.textStyle15),
              TextSpan(
                  text: '${sliderValue.toInt()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ])),
            const SizedBox(
              height: 10,
            ),
            selecting.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<GetLaptopsCubit>(context)
                          .recommendedLaptops(
                              selecting.map((e) => e.id!).toList(),
                              sliderValue.toInt());
                    },
                    child: const Text(
                      'Generate Your Laptop',
                      style: TextStyle(color: kBlackColor),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
      BlocBuilder<GetLaptopsCubit, GetLaptopsState>(
        builder: (context, state) {
          if (state is GetLaptopsSuccess) {
            return const SliverToBoxAdapter(
              child: Text(
                'Your Recommended Laptop',
                style: Styles.textStyle20,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return SliverToBoxAdapter(child: Container());
          }
        },
      ),
      BlocBuilder<GetLaptopsCubit, GetLaptopsState>(
        builder: (context, state) {
          if (state is GetLaptopsSuccess) {
            return SliverList.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: width * 0.2),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: NewestLaptopsItem(
                      image: imageList[index],
                      laptops: state.laptops[index],
                    ),
                  ),
                );
              },
              itemCount: 7,
            );
          } else if (state is GetLaptopsLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is GetLaptopsFaluire) {
            return SliverToBoxAdapter(child: Text(state.messsage));
          } else {
            return SliverToBoxAdapter(child: Container());
          }
        },
      ),
    ]);
  }

  Slider slider() {
    return Slider(
      max: 200000,
      value: sliderValue,
      onChanged: (value) {
        setState(() {
          sliderValue = value;
        });
      },
      label: sliderValue.round().toString(),
      divisions: 1000,
      min: 2000,
    );
  }

  TypeAheadField<ProgramModel> searchBar(SearchSuccess state) {
    return TypeAheadField(
      suggestionsCallback: (search) {
        return suggestionCallBack(state, search);
      },
      builder: (context, controller, focusNode) {
        return CustomTextField(
          controller: controller,
          focusNode: focusNode,
        );
      },
      itemBuilder: (context, value) {
        return ListTile(
          title: Text(value.name ?? ""),
          subtitle: Text(value.name ?? ""),
        );
      },
      onSelected: (value) {
        {
          onSelected(value);
        }
      },
    );
  }

  Wrap wrapping() {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: selecting
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Chip(
                      onDeleted: () {
                        selecting.remove(e);
                        setState(() {});
                      },
                      label: Text(e.name!),
                      backgroundColor: const Color.fromARGB(255, 216, 213, 213),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide.none)),
                ))
            .toList());
  }

  void onSelected(ProgramModel value) {
    return setState(() {
      selecting.add(value);
    });
  }

  List<ProgramModel> suggestionCallBack(SearchSuccess state, String search) {
    return state.programs
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      focusNode: focusNode,
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
