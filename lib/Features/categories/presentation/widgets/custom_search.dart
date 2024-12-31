import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(
          AssetsManager.search,
          colorFilter: const ColorFilter.mode(
              ColorManager.lightGrey3, BlendMode.dst),
        ),
      ),
      controller: TextEditingController(),
      borderSideColor: ColorManager.lightGrey3,
      labelText: '',
      hintText: AppLocalizations.of(context)!.search,
      hintStyle:
          getBoldStyle(color: ColorManager.lightGrey3, fontSize: 14),
    );
  }
}
