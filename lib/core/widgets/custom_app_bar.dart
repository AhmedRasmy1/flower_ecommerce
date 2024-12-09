import '../utils/cashed_data_shared_preferences.dart';

import '../resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onTap,
    this.color,
    this.image,
    this.subtitle,
    this.fontFamily,
  });

  final String? title;
  final void Function()? onTap;
  final Color? color;
  final String? image;
  final String? subtitle;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (onTap != null)
              GestureDetector(
                onTap: onTap,
                child: Transform(
                  alignment: Alignment.center,
                  transform: CacheService.getData(
                              key: CacheConstants.defaultLanguage) ==
                          'ar'
                      ? Matrix4.rotationY(3.1416)
                      : Matrix4.identity(),
                  child: SvgPicture.asset(AssetsManager.vector),
                ),
              ),
            const SizedBox(width: AppSize.s8),
            if (image != null)
              SvgPicture.asset(
                width: AppSize.s20,
                height: AppSize.s20,
                image!,
                fit: BoxFit.scaleDown,
              ),
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  fontSize: FontSize.s22,
                  color: color ?? Colors.black,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: fontFamily,
                ),
              ),
          ],
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(left: AppSize.s32),
            child: Text(
              subtitle!,
              style: const TextStyle(
                fontSize: FontSize.s14,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }
}
