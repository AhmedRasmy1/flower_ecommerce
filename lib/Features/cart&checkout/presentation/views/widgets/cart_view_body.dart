import '../../../../auth/presentation/widgets/loading_manager.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/fetch_user_cart/fetch_user_cart_view_model.dart';
import '../check_out_view.dart';
import 'cart_item/product_cart_item.dart';
import 'delivered_to.dart';
import 'empty_cart_widget.dart';
import 'guest_user_cart.dart';
import 'order_details.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  List<CartItemEntity>? _cartItems;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchUserCartViewModel, FetchUserCartState>(
      listener: (context, state) {
        if (state is FetchUserCartSuccess) {
          _cartItems?.clear();
          _cartItems = state.cartItems;
        }
        if (state is FetchUserCartFailure) {
          debugPrint(state.exception.toString());
        }
      },
      builder: (context, state) {
        if (state is FetchUserCartLoading && state.isFirst) {
          return const Center(
            child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                color: ColorManager.pink,
              ),
            ),
          );
        }
        if (_cartItems != null && _cartItems!.isEmpty) {
          return const EmptyCart();
        }
        return _cartItems != null
            ? CustomLoadingManager(
                isLoading: state is FetchUserCartLoading,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(
                    AppPadding.p16,
                  ),
                  child: Column(
                    children: [
                      CustomAppBar(
                        title:
                            "${AppLocalizations.of(context)!.cart} (${_cartItems!.length} ${AppLocalizations.of(context)!.items})",
                        color: ColorManager.grey,
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
                        itemBuilder: (context, index) => ProductCartItem(
                          cartItemEntity: _cartItems![index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 24,
                        ),
                        itemCount: _cartItems!.length,
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      OrderDetails(
                        total: getTotal(_cartItems!),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      SizedBox(
                        height: 50,
                        child: CustomElevatedButton(
                          buttonColor: ColorManager.pink,
                          title: AppLocalizations.of(context)!.checkout,
                          onPressed: () {
                            handleCheckout();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            : GuestUserCart();
      },
    );
  }

  double getTotal(List<CartItemEntity> cartItem) {
    double total = 0;
    for (var item in cartItem) {
      total += item.quantity! * item.price!.toDouble();
    }
    return total;
  }

  void handleCheckout() {
    final cachedToken = CacheService.getData(key: CacheConstants.userToken);
    if (cachedToken != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(arguments: _cartItems),
            builder: (context) => const CheckOutView()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(arguments: _cartItems),
            builder: (context) => const CheckOutView()),
      );
    }
  }
}
