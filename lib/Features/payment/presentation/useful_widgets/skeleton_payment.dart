import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../cart&checkout/presentation/views/widgets/order_details.dart';
import 'order_summery_item.dart';


class SkeletonPayment extends StatelessWidget {
  const SkeletonPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 45,
              color: Color(0XFF2F9033),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Thank you for shopping with us!",
              style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 4,
              color: ColorManager.white,
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.cartLocationSvgImage,
                          width: 24,
                          height: 24,
                        ),
                        Expanded(
                            child: Text(
                              'widget.street ?? ""',
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('widget.city ?? ""')
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              color: ColorManager.white,
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.money,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "EGY 300",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child:Text("Pay with cash"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      Text(
                        " Items",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => OrderSummeryItem(
                        imageUrl: "widget.orderItems?[index].imgCover ?? """,
                        itemTitle: "widget.orderItems?[index].title ?? """,
                        itemDetails: "widget.orderItems?[index].description ?? """,
                        itemPrice:'125'),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 24,
                    ),
                    itemCount: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            OrderDetails(total:55.toDouble() ?? 0),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 190,
                  child: CustomElevatedButton(
                    buttonColor: ColorManager.pink,
                    title: "Continue shopping",
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 190,
                  child: CustomElevatedButton(
                    buttonColor: ColorManager.pink,
                    title: "Track Order",
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
