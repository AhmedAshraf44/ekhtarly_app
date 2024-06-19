import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/functions/build_border.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
import 'package:ekhtarly_app/features/search/presentation/cubit/search_cubit.dart';
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
  var selecting = <String>{};


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
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
            selecting.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Generate Your Laptop',
                      style: TextStyle(color: kBlackColor),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
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
                      label: Text(e),
                      backgroundColor: const Color.fromARGB(255, 216, 213, 213),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide.none)),
                ))
            .toList());
  }

  void onSelected(ProgramModel value) {
    return setState(() {
      selecting.add(value.name!);
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
