// into in future to list view builder
import 'package:ekhtarly_app/features/home/presentation/view/widgets/custom_descrption_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/models/newest_laptops_details_model/laptops.dart';

class NewestLaptopDetailsDescrptionItem extends StatelessWidget {
  const NewestLaptopDetailsDescrptionItem({super.key, required this.laptops});
  final Laptops laptops;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              CustomDescrptionItem(
                text: 'Brand',
                textValue: laptops.brand!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Processor',
                textValue: laptops.processor!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'CPU',
                textValue: laptops.cpu!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Ram',
                textValue: laptops.ram!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Ram Type',
                textValue: laptops.ramType!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'ROM',
                textValue: laptops.rom!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Rom Type',
                textValue: laptops.romType!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'GPU',
                textValue: laptops.gpu!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Display Size',
                textValue: laptops.displaySize!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Resolution Width',
                textValue: laptops.resolutionWidth!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Resolution Height',
                textValue: laptops.resolutionHeight!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                text: 'Operating System',
                textValue: laptops.os!,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              CustomDescrptionItem(
                textValue: laptops.brand!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.processor!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.cpu!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.ram!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.ramType!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.rom!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.romType!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.gpu!,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.displaySize!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.resolutionWidth!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.resolutionHeight!.toString(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDescrptionItem(
                textValue: laptops.os!,
              ),
            ],
          ),
        )
      ],
    );
  }
}
