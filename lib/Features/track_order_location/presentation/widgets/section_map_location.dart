import 'skeleton_map.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';

import 'map_tracking_location.dart';

class SectionMapLocation extends StatelessWidget {
  const SectionMapLocation({
    super.key,
    // required this.orderDetails,
    // required this.isUser,
  });

  // final Orders orderDetails;
  // final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          MapTrackingLocation(
            idOrder: '67a02f3c941115133e6f8a2b',
          ),
          Positioned(
            top: 64,
            left: 18,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AssetsManager.backIconMap),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _loadData() async {
  await Future.delayed(Duration(seconds: 2));
}
