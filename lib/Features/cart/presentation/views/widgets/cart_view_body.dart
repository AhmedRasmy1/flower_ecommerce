import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/cart_item/cart_item.dart';
import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/delivered_to.dart';
import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/order_details.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flower_ecommerce/core/widgets/custom_elevated_button.dart';
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const CartItem(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
            itemCount: 3,
          ),
          const SizedBox(
            height: 33,
          ),
          const OrderDetails(),
          const SizedBox(
            height: 48,
          ),
          SizedBox(
            height: 50,
            child: CustomElevatedButton(
              buttonColor: ColorManager.pink,
              title: "Checkout",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
