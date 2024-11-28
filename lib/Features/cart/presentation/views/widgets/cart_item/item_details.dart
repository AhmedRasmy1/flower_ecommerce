import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Red roses",
              style: const TextStyle().copyWith(
                fontWeight: FontWeight.w500,
                fontSize: AppSize.s16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "15 Pink Rose Bouquet",
              style: const TextStyle().copyWith(
                fontWeight: FontWeight.w400,
                fontSize: AppSize.s13,
                color: ColorManager.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
