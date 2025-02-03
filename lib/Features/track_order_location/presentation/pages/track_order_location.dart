import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/section_card.dart';
import '../widgets/section_map_location.dart';

class TrackOrderLocation extends StatelessWidget {
  const TrackOrderLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          SectionMapLocation(),
          SectionCard(),
        ],
      ),
    );
  }
}
