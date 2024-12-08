import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s8, vertical: AppSize.s10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.pink.withOpacity(.8),
        ),
        onPressed: () {
          /// go to Filter
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AssetsManager.imagesFilter,
              width: AppSize.s20,
              height: AppSize.s20,
              colorFilter: const ColorFilter.mode(
                ColorManager.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: AppSize.s12,
            ),
            Text(
              AppLocalizations.of(context)!.filter,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: AppSize.s20),
            ),
          ],
        ),
      ),
    );
  }
}
