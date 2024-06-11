import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/view_model/cubit/comprasion_cubit.dart';
import 'package:ekhtarly_app/features/home/presentation/view/widgets/newest_laptops_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewestLaptopsView extends StatefulWidget {
  const NewestLaptopsView({super.key, required this.laptops});
  final Laptops laptops;

  @override
  State<NewestLaptopsView> createState() => _NewestLaptopsViewState();
}

class _NewestLaptopsViewState extends State<NewestLaptopsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NewestLaptopsDetails(
          laptops: widget.laptops,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widget.laptops.isCompared == true) {
              BlocProvider.of<ComprasionCubit>(context)
                  .removeItem(widget.laptops);
              widget.laptops.isCompared = false;
              setState(() {});
            } else {
              BlocProvider.of<ComprasionCubit>(context).addItem(widget.laptops);
              BlocProvider.of<ComprasionCubit>(context).doComprasion();
              widget.laptops.isCompared = true;
              setState(() {});
            }
          },
          shape: CircleBorder(),
          backgroundColor: kPrimaryColor,
          child: widget.laptops.isCompared
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.balance,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
