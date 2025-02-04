import '../../../../core/firebase_core/model/order_details_add_firestore.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/section_card.dart';
import '../widgets/section_map_location.dart';

class TrackOrderLocation extends StatelessWidget {
  const TrackOrderLocation({
    super.key, this.orderData,
  });
final  Orders? orderData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          SectionMapLocation(orderData: orderData,),
          SectionCard(orderData: orderData,),
        ],
      ),
    );
  }
}
