import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class UpperFilterBox extends StatelessWidget {
  const UpperFilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: ColorManager.lightGrey3, width: 1.5),
      ),
      child: SvgPicture.asset(
        AssetsManager.menu,
        height: 24,
        width: 24,
      ),
    );
  }
}
