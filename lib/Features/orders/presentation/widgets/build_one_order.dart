import 'package:flower_ecommerce/core/resources/style_manager.dart';
import '../../data/model/user_orders.dart';
import '../../../track%20order/presentation/track_ui.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';

class BuildOneOrder extends StatelessWidget {
 const BuildOneOrder({required this.order, super.key});

 final UserOrders order;

  @override
  Widget build(BuildContext context) {
    bool isCompleted = true;
    if (order.state == "completed") {
      isCompleted = true;
    } else {
      isCompleted = false;
    }
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(
          top: AppSize.s20, left: AppSize.s24, right: AppSize.s24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
          side: BorderSide(color: Colors.grey)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Row(
          children: [
            Image.asset(
              'assets/images/bouqeut2.png', // Replace with your image asset
              height: 140,
              width: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: AppSize.s16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order number ${order.orderNumber}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    const SizedBox(height: AppSize.s4),
                    Text("EGP ${order.totalPrice}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                
                    Text("${order.state}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: AppSize.s16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: isCompleted
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.pink,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20)),
                              ),
                              onPressed: () {},
                              child: Text("Reorder",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                backgroundColor: ColorManager.pink,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20)),
                              ),
                              onPressed: () {
                                print(order.id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TrackOrderScreen(),
                                        settings: RouteSettings(
                                            arguments: order.id)));
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Track Order",
                                        style: getSemiBoldStyle(fontSize: AppSize.s12)),
                                  ),
                                ],
                              ),
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
