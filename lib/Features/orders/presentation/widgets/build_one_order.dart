import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../useful_classes/my_order_details.dart';


class BuildOneOrder extends StatelessWidget {
   BuildOneOrder({required this.order,
    super.key});

    MyOrderDetails order;

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      margin: const EdgeInsets.only(top:AppSize.s20 ,left:AppSize.s40,right:AppSize.s40 ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s10)
          ,side: BorderSide(color: Colors.grey)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Row(
          children: [
            Image.asset(
              'assets/images/bouqeut2.png', // Replace with your image asset
              height: 140,
              width:160,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: AppSize.s16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.title,
                        style: const TextStyle(
                            fontSize: 12, fontWeight:FontWeight.w400)),
                    const SizedBox(height: AppSize.s4),
                    Text(order.price,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black,fontWeight:FontWeight.w500)),
                    if (order.deliveredDate != null) ...[
                      const SizedBox(height: AppSize.s4),
                      Text(order.deliveredDate!,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey,fontWeight:FontWeight.w500)),
                    ],
          SizedBox(height: AppSize.s16,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          backgroundColor: ColorManager.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s20)),
                        ),
                        onPressed: () {},
                        child: Text(order.buttonLabel,style: const TextStyle(
                            fontSize: 13, fontWeight:FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
