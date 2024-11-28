import 'package:flower_ecommerce/Features/cart/presentation/pages/widgets/cart_item.dart';
import 'package:flower_ecommerce/Features/cart/presentation/pages/widgets/delivered_to.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(
        AppPadding.p16,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: "Cart (3 items)",
            color: ColorManager.grey,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const DeliveredTo(),
          const SizedBox(
            height: 24,
          ),
          CartItem()
          // Add your cart items here...
        ],
      ),
    );
  }
}
