import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: ColorManager.lightPink,
      ),
      child: Image.asset(
        AppAssets.cartPlaceHolderImage,
        width: 66,
        height: 87,
      ),
    );
  }
}
