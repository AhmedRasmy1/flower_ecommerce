import '../../../../data/models/request/update_quantity_request.dart';
import '../../../manager/delete_product/delete_product_view_model.dart';
import '../../../manager/fetch_user_cart/fetch_user_cart_view_model.dart';
import '../../../manager/update_product_quantity/update_product_quantity_view_model.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/widgets/warning_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

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
        BlocProvider<DeleteProductViewModel>.value(
          value: GetIt.instance.get<DeleteProductViewModel>(),
          child: Builder(
            builder: (context) {
              return InkWell(
                onTap: () {
                  final deleteProductViewModel =
                      DeleteProductViewModel.of(context);
                  _updateQuantity(
                    context: context,
                    productQuantity: --productQuantity,
                    deleteProductViewModel: deleteProductViewModel,
                  );
                },
                child: SvgPicture.asset(
                  AppAssets.cartMinusSvgIcon,
                  width: 24,
                  height: 24,
                ),
              );
            },
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
            _updateQuantity(
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

  void _updateQuantity({
    required int productQuantity,
    required BuildContext context,
    DeleteProductViewModel? deleteProductViewModel,
  }) async {
    final fetchCartViewModel = FetchUserCartViewModel.of(context);

    if (productQuantity == 0) {
      showWarningDialogue(
        message: "You are about to delete the Item Permanently!!",
        onPressed: () {
          _deleteProduct(deleteProductViewModel!, fetchCartViewModel);
        },
        context: context,
      );
      return;
    }
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
          await fetchCartViewModel.fetchUserCart();
        }
      },
    );
  }

  void _deleteProduct(DeleteProductViewModel deleteProductViewModel,
      FetchUserCartViewModel fetchCartViewModel) async {
    deleteProductViewModel.deleteProduct(productId).then(
      (_) async {
        await fetchCartViewModel.fetchUserCart();
      },
    );
  }
}
