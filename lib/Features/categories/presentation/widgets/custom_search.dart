import 'package:flower_ecommerce/Features/categories/presentation/widgets/upperfilterbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, this.onTap});
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              enabled: true,
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.searchView);
              },
              prefixIcon: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  AssetsManager.search,
                  height: 20,
                  width: 20,
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
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: onTap,
              child: UpperFilterBox())
        ],
      ),
    );
  }
}
