import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/app_assets.dart';

class DeliveredTo extends StatelessWidget {
  const DeliveredTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.cartLocationSvgImage,
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 2.5,
        ),
        Text(
          "Delivered to",
          style: const TextStyle().copyWith(
            color: ColorManager.grey,
            fontSize: AppSize.s16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "2XVP+XC - Sheikh Zayed.....",
          style: const TextStyle().copyWith(
            color: ColorManager.black,
            fontSize: AppSize.s16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          AppAssets.arrowRightSvgImage,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
