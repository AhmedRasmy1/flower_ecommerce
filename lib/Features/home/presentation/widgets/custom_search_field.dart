import 'package:flower_ecommerce/Features/search/presentation/views/search_screen_view.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../search/presentation/views/search_screen_view.dart';


class CustomTextFieldForSearch extends StatelessWidget {
  const CustomTextFieldForSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (){
        Navigator.pushNamed(context,
            RoutesManager.searchView);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p16,
        ),
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: TextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.grey,
          fontWeight: FontWeightManager.medium,
        ),
        prefixIcon: SizedBox(
          width: AppSize.s18,
          height: AppSize.s18,
          child: SvgPicture.asset(
            AssetsManager.searchIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.offWhite,
            width: AppSize.w1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.offWhite,
          ),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
    );
  }
}
