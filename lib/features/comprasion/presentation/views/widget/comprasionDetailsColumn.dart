import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/comprasion/presentation/views/widget/customDescrptionItemBox.dart';
import 'package:flutter/material.dart';

class ComprasionDetailsColumn extends StatelessWidget {
  const ComprasionDetailsColumn({
    super.key,
    required this.laptops,  this.secand=false,
  });
  final bool secand;
  final Laptops laptops;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDescrptionItemBox(
          text: 'Brand',
          secand: secand,
          textValue: laptops.brand!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Processor',
                    secand: secand,

          textValue: laptops.processor!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'CPU',
                    secand: secand,

          textValue: laptops.cpu!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Ram',
                    secand: secand,

          textValue: laptops.ram!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Ram Type',
                    secand: secand,

          textValue: laptops.ramType!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'ROM',
                    secand: secand,

          textValue: laptops.rom!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Rom Type',
                    secand: secand,

          textValue: laptops.romType!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'GPU',
                    secand: secand,

          textValue: laptops.gpu!,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Display Size',
                    secand: secand,

          textValue: laptops.displaySize!.toString(),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Resolution Width',
                    secand: secand,

          textValue: laptops.resolutionWidth!.toString(),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Resolution Height',
                    secand: secand,

          textValue: laptops.resolutionHeight!.toString(),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomDescrptionItemBox(
          text: 'Operating System',
                    secand: secand,

          textValue: laptops.os!,
        ),
      ],
    );
  }
}
