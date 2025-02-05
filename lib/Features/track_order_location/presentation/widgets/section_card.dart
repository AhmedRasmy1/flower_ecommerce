import '../../../../core/firebase_core/model/order_details_add_firestore.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_card_details.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key, this.orderData,
  });
  final  Orders? orderData;
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
              phone: orderData?.driver?.phone??'',
              subTitle:  orderData?.driver?.phone??'',
              title2:
                   "${orderData?.driver?.firstName} ${orderData?.driver?.lastName}",

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
          height: 45,
        ),
      ],
    ));
  }
}
