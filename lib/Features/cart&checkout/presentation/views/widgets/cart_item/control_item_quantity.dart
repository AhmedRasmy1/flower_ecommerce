import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/presentation/manager/fetch_user_cart/fetch_user_cart_view_model.dart';
import 'package:flower_ecommerce/Features/cart&checkout/presentation/manager/update_product_quantity/update_product_quantity_view_model.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ControlItemQuantity extends StatelessWidget {
  const ControlItemQuantity({
    super.key,
    required this.quantity,
    required this.productId,
  });
  final int quantity;
  final String productId;
  @override
  Widget build(BuildContext context) {
    var productQuantity = quantity;

    return Row(
      children: [
        InkWell(
          onTap: () {
            updateQuantity(
              context: context,
              productQuantity: --productQuantity,
            );
          },
          child: SvgPicture.asset(
            AppAssets.cartMinusSvgIcon,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        BlocBuilder<FetchUserCartViewModel, FetchUserCartState>(
          builder: (context, state) {
            return Text(
              "$quantity",
              style: const TextStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: AppSize.s14,
              ),
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {
            updateQuantity(
              context: context,
              productQuantity: ++productQuantity,
            );
          },
          child: SvgPicture.asset(
            AppAssets.cartPlusSvgIcon,
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  void updateQuantity(
      {required int productQuantity, required BuildContext context}) async {
    debugPrint(productQuantity.toString());
    debugPrint(productId);
    final updateProductReq = UpdateQuantityRequest(
      quantity: productQuantity,
    );
    await UpdateProductQuantityViewModel.of(context)
        .updateProductQuantity(
      updateQuantityRequest: updateProductReq,
      productId: productId,
    )
        .then(
      (_) async {
        if (context.mounted) {
          await FetchUserCartViewModel.of(context).fetchUserCart();
        }
      },
    );
  }
}
