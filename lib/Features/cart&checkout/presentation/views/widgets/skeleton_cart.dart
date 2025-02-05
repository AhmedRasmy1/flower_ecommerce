import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import 'cart_item/product_cart_item.dart';
import 'delivered_to.dart';
import 'order_details.dart';
class SkeletonCart extends StatelessWidget {
  const SkeletonCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomAppBar(
              title:'ssssssssssssss',
              color: ColorManager.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            const DeliveredTo(),
            const SizedBox(
              height: 24,
            ),
            ProductCartItem(
              cartItemEntity: CartItemEntity(
                  id: 'sdsdsd',
                  totalPrice: 5456,
                  title: 'sadsdsd',
                  imgCover: 'https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png',
                  quantity: 5,
                  price: 55,
                  description: 'sadsad'),),
            SizedBox(height: 16,),
            OrderDetails(
              total: 25.5,
            ),
            const SizedBox(
              height: 48,
            ),
            SizedBox(
              height: 50,
              child: CustomElevatedButton(
                buttonColor: ColorManager.pink,
                title: 'sssssssssssssss',
                onPressed: () {

                },
              ),
            )

          ],
        ),
      )
    );
  }
}

