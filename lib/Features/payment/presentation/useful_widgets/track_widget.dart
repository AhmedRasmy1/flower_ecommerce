import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';

import '../../../cart&checkout/domain/entities/cart_item_entity.dart';
import 'order_summery_item.dart';
import 'payment_button.dart';
import '../../../../core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../cart&checkout/presentation/views/widgets/order_details.dart';

class TrackWidget extends StatefulWidget {
  TrackWidget({
    this.paymentUrl,
    required this.orderItems,
    required this.city,
    required this.street,
    required this.totalPrice,
    required this.isCash,
    super.key,
  });

  List<CartItemEntity>? orderItems;
  String? city;
  String? street;
  num? totalPrice;
  bool? isCash;
  String? paymentUrl;

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  num deliveryFees = 10;

  @override
  Widget build(BuildContext context) {
    num totalPriceWithDelivery = (widget.totalPrice ?? 0) + deliveryFees;
    return Padding(
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
              padding: const EdgeInsets.all(10.0),
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
                        widget.street ?? "",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(widget.city ?? "")
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
                        "EGY ${totalPriceWithDelivery.toString()}",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: (widget.isCash ?? true)
                        ? Text("Pay with cash")
                        : PaymentButton(checkoutUrl: widget.paymentUrl),
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
                      "${widget.orderItems?.length.toString()} Items",
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
                      imageUrl: widget.orderItems?[index].imgCover ?? "",
                      itemTitle: widget.orderItems?[index].title ?? "",
                      itemDetails: widget.orderItems?[index].description ?? "",
                      itemPrice:
                          widget.orderItems?[index].price.toString() ?? ""),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 24,
                  ),
                  itemCount: widget.orderItems!.length,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          OrderDetails(total: widget.totalPrice?.toDouble() ?? 0),
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
                    Navigator.pushNamed(context, RoutesManager.layoutRoute);
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
    );
  }
}
