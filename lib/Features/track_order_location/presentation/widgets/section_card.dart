import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'custom_card_details.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 0), // تحكم في التباعد
          title: Text(
            'Estimated arrival',
            style: getRegularStyle(
                color: ColorManager.placeHolderColor, fontSize: 14),
          ),
          subtitle: Text(
            '03 Sep 2024, 11:00 AM',
            style: getBoldStyle(fontSize: 16),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomCardDetails(
              phone: '+01200361136',
              subTitle: ' orderDetails.user?.phone ?? ' '',
              title2:
                  // "${orderDetails.user?.firstName} ${orderDetails.user?.lastName}",
                  'mohammed zewin',
              urlImage:
                  'https://flower.elevateegy.com/uploads/default-profile.png',
              noIcon: false),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomElevatedButton(
            buttonColor: ColorManager.pink,
            title: 'Order details',
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 34,
        ),
      ],
    ));
  }
}
