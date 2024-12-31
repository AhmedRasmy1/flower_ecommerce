import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.title,
    this.viewAll,
    this.onTap,
  });
  final String? title;
  final String? viewAll;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (viewAll != null)
          GestureDetector(
            onTap: onTap,
            child: Text(
              AppLocalizations.of(context)!.viewAll,
              style: const TextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.pink,
                decoration: TextDecoration.underline,
                decorationColor: ColorManager.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
