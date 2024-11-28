import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ControlItemQuantity extends StatelessWidget {
  const ControlItemQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.cartMinusSvgIcon,
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "1",
          style: const TextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: AppSize.s14,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(
          AppAssets.cartPlusSvgIcon,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
