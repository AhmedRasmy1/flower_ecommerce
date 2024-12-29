import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_widgets/order_summery_item.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_widgets/payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../cart&checkout/presentation/views/widgets/order_details.dart';
import '../../data/model/response/cash_order_response/OrderItems.dart';

class TrackWidget extends StatefulWidget {
  TrackWidget({
    this.paymentUrl, required this.orderItems,
  required this.city,
  required this.street,
  required this.totalPrice,
    required this.isCash,super.key,
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
  num deliveryFees=10;

  @override
  Widget build(BuildContext context) {
    num totalPriceWithDelivery=(widget.totalPrice??0 )+ deliveryFees;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Icon(Icons.check_circle,size: 45,color:Color(0XFF2F9033),),
         SizedBox(height: 10,),
         Text("Your order placed successfully!"),
         SizedBox(height: 10,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               height: 3,
               width: 100,
               color: Color(0XFF2F9033),
             ),
             Container(
               height: 3,
               width: 100,
               color: Color(0XFFA6A6A6),
             ),
             Container(
               height: 3,
               width: 100,
               color: Color(0XFFA6A6A6),
             ),
             Container(
               height: 3,
               width: 100,
               color: Color(0XFFA6A6A6),
             )
           ],
         ),
         SizedBox(height: 10,),
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
                   Text(widget.street??""),
                 ],
               ),
               Text(widget.city??"")
             ],
           ),
         ),
         SizedBox(height: 10,),
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
                   Text("EGY ${totalPriceWithDelivery.toString()}"),
                 ],
               ),
            Container(
              child: (widget.isCash?? true) ? Text("Pay with cash"):PaymentButton(checkoutUrl: widget.paymentUrl),
            )

             ],
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
                   Icon(Icons.shopping_cart_outlined,),
                   Text("${widget.orderItems?.length.toString()} Items",
                   style: TextStyle(
                     fontSize: 16
                   ),
                   ),
                 ],
               ),
               SizedBox(height: 20,),
               ListView.separated(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) => OrderSummeryItem(imageUrl: widget.orderItems?[index].imgCover??"", itemTitle: widget.orderItems?[index].title??"", itemDetails:widget.orderItems?[index].description??"", itemPrice: widget.orderItems?[index].price.toString()??""),
                 separatorBuilder: (context, index) => const SizedBox(
                   height: 24,
                 ),
                 itemCount: widget.orderItems!.length,
               ),
               SizedBox(height: 20,),


             ],
           ),
         ),
         OrderDetails(total: widget.totalPrice?.toDouble()??0),
         SizedBox(height: 20,),
         Row(
           children: [
             SizedBox(
               height: 50,
               width:190,
               child: CustomElevatedButton(
                 buttonColor: ColorManager.pink,
                 title:"Continue shopping",
                 onPressed: () {
                 },
               ),
             ),
             SizedBox(width: 20,),
             SizedBox(
               height: 50,
               width: 190,
               child: CustomElevatedButton(
                 buttonColor: ColorManager.pink,
                 title:"Cancel order",
                 onPressed: () {
                 },
               ),
             )
           ],
         )

       ],
      ),
    );
  }
}
