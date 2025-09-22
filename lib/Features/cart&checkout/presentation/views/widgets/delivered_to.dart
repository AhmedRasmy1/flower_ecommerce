import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';

import '../../../../home/presentation/widgets/custom_location.dart';

class DeliveredTo extends StatelessWidget {
  const DeliveredTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLocation(
      icon: AssetsManager.locationIcon,
      arrow: AssetsManager.arrowIcon,
    );
  }
}
