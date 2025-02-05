
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../views/product_details_view.dart';
import 'custom_text.dart';



class SkeletonSearch extends StatelessWidget {
  const SkeletonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    'https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 14,),
                Text('age_on_one014d9-b339-d81be57e0149-im-c067-46d9-b339-d81be57eage_one.png'),
                Text('age_on_one014d9-b339-d81be57e0149-im-c067-46d9-b339-d81be57eage_one.png'),


              ],
            ),
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomElevatedButton(
              buttonColor: ColorManager.pink,
              title:
              'sssssss',
              onPressed: () async {

              },
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
