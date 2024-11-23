import '../resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.onTap,
      this.color,
      this.image,
      this.subtitle});

  final String? title;
  final void Function()? onTap;
  final Color? color;
  final String? image;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(AssetsManager.vector),
          ),
        const SizedBox(width: AppSize.s8),
        if (image != null)
          SvgPicture.asset(
            width: AppSize.s20,
            height: AppSize.s20,
            image!,
            fit: BoxFit.scaleDown,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  fontSize: FontSize.s22,
                  color: color ?? Colors.black,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  color: Colors.black,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
