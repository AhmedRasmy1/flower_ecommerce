import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/cart_item/control_item_quantity.dart';
import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/cart_item/item_details.dart';
import 'package:flower_ecommerce/Features/cart/presentation/views/widgets/cart_item/item_image.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ItemImage(),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ItemDetails(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "EGP 600",
                      style: const TextStyle().copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.s14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    AppAssets.cartDeleteSvgIcon,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const ControlItemQuantity(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
