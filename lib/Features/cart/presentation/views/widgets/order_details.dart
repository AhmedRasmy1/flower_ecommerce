import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/order_info_row.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrderInfoRow(
          title: "Sub Total",
          value: r'100$',
        ),
        SizedBox(
          height: 8,
        ),
        OrderInfoRow(
          title: "Delivery Fee",
          value: r'10$',
        ),
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 0,
          thickness: 0.5,
          color: ColorManager.offWhite,
        ),
        SizedBox(
          height: 8,
        ),
        OrderInfoRow(
          title: "Total",
          value: r'110$',
          style: TextStyle(
            fontSize: AppSize.s18,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
