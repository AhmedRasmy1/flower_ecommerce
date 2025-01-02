

import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../cart&checkout/presentation/views/widgets/cart_item/item_details.dart';
import '../../../cart&checkout/presentation/views/widgets/cart_item/item_image.dart';
import '../useful_methods/split_text.dart';
import 'order_summery_item_image.dart';

class OrderSummeryItem extends StatelessWidget {
  OrderSummeryItem({super.key,
    required this.imageUrl,
    required this.itemTitle,
    required this.itemDetails,
    required this.itemPrice,
  });

 String imageUrl;
 String itemTitle;
 String itemDetails;
 String itemPrice;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,

      child: Material(
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),

        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OrderSummeryItemImage(
              image: imageUrl,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text( itemTitle),
                Text(
                  splitText(itemDetails, 40),
                  style: const TextStyle(fontSize: 12),
                ),


              ],
            ),
            Spacer(),
            Text(
              " $itemPrice EGP",
              style: const TextStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: AppSize.s14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
