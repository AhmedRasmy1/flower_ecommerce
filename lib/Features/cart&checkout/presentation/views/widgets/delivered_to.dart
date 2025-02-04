import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../home/presentation/widgets/custom_location.dart';

class DeliveredTo extends StatelessWidget {
  const DeliveredTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return    CustomLocation(
      icon: AssetsManager.locationIcon,
      arrow: AssetsManager.arrowIcon,
    );
  }
}
