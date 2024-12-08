import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.deliveredTo,
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
          AppLocalizations.of(context)!.location,
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
