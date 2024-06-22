import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/views/widget/comprasionDetailsColumn.dart';
import 'package:flutter/material.dart';

class ComprasionDetails extends StatelessWidget {
  const ComprasionDetails({super.key, required this.laptops});
  final List<Laptops> laptops;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: ComprasionDetailsColumn(laptops: laptops[0]),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ComprasionDetailsColumn(
              laptops: laptops[1],
              secand: true,
            ),
          )
        ],
      ),
    );
  }
}
