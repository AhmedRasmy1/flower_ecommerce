import '../../../../core/firebase_core/model/order_details_add_firestore.dart';
import 'skeleton_map.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';

import 'map_tracking_location.dart';

class SectionMapLocation extends StatelessWidget {
  const SectionMapLocation({
    super.key,
    this.orderData,
  });

  final Orders? orderData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          MapTrackingLocation(
            orderData: orderData,
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

