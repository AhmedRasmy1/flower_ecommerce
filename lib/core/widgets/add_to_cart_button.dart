import '../common/add_to_cart/data/models/request/add_to_cart_req_body.dart';
import '../common/add_to_cart/manager/cubit/add_to_cart_view_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import '../utils/cashed_data_shared_preferences.dart';
import 'error_toast.dart';
import 'success_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<AddToCartViewModel>(),
      child: BlocConsumer<AddToCartViewModel, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartSuccess) {
            showSuccessToast(
              context: context,
              message: AppLocalizations.of(context)!.addedToCartSuccess,
              title: AppLocalizations.of(context)!.done,
            );
          } else if (state is AddToCartFailure) {
            final String message;
            if (CacheConstants.userToken == '') {
              message = AppLocalizations.of(context)!.loginToPurchase;
            } else {
              message = AppLocalizations.of(context)!.loginToPurchase;
            }
            return showErrorToast(
              context: context,
              message: message,
            );
          }
        },
        builder: (context, state) {
          return state is AddToCartLoading
              ? const SizedBox(
                  height: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: LinearProgressIndicator(
                      color: ColorManager.pink,
                    ),
                  ),
                )
              : SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final addToCartBody = AddToCartReqBody(
                        productId: productId,
                      );
                      await AddToCartViewModel.of(context).addProductToCart(
                        addToCartBody,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.cart,
                          width: 15,
                          height: 15,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.addToCart,
                          style: const TextStyle().copyWith(
                            color: ColorManager.white,
                            fontSize: AppSize.s13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
