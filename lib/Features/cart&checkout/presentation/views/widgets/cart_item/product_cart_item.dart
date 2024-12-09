import '../../../../domain/entities/cart_item_entity.dart';
import '../../../manager/delete_product/delete_product_view_model.dart';
import '../../../manager/fetch_user_cart/fetch_user_cart_view_model.dart';
import '../../../manager/update_product_quantity/update_product_quantity_view_model.dart';
import 'control_item_quantity.dart';
import 'item_details.dart';
import 'item_image.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/widgets/warning_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 120,
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
              ItemImage(
                image: cartItemEntity.imgCover!,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemDetails(
                      title: cartItemEntity.title!,
                      description: cartItemEntity.description!,
                    ),
                    Text(
                      " ${cartItemEntity.price}${AppLocalizations.of(context)!.currencyEGP}",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocProvider(
                    create: (context) =>
                        GetIt.instance.get<DeleteProductViewModel>(),
                    child: Builder(builder: (context) {
                      final deleteProductViewModel =
                          DeleteProductViewModel.of(context);
                      final fetchCartViewModel =
                          FetchUserCartViewModel.of(context);
                      return InkWell(
                        onTap: () async {
                          showWarningDialogue(
                            message: AppLocalizations.of(context)!
                                .deleteConfirmation,
                            onPressed: () {
                              deleteProductViewModel
                                  .deleteProduct(cartItemEntity.id!)
                                  .then(
                                (_) async {
                                  await fetchCartViewModel.fetchUserCart();
                                },
                              );
                            },
                            context: context,
                          );
                        },
                        child: SvgPicture.asset(
                          AppAssets.cartDeleteSvgIcon,
                          width: 24,
                          height: 24,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  BlocProvider(
                    create: (context) =>
                        GetIt.instance.get<UpdateProductQuantityViewModel>(),
                    child: ControlItemQuantity(
                      quantity: cartItemEntity.quantity!,
                      productId: cartItemEntity.id!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
