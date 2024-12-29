import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/Features/payment/data/model/request/payment_checkout_request.dart';
import 'package:flower_ecommerce/Features/payment/data/model/response/cash_order_response/OrderItems.dart';
import 'package:flower_ecommerce/Features/payment/presentation/cash_order_view_model/cash_order_cubit.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_methods/payment_navegation_items.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_widgets/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../products/presentation/widgets/skeleton_body.dart';
import '../cash_order_view_model/cash_order_state.dart';

class PaymentCashPage extends StatefulWidget {
  const PaymentCashPage({super.key});

  @override
  State<PaymentCashPage> createState() => _PaymentCashPageState();
}

class _PaymentCashPageState extends State<PaymentCashPage> {

  late CashOrderViewModel cashOrderViewModel;
 late PaymentNavigationItems paymentData;

  @override
  void initState() {
    super.initState();
    cashOrderViewModel = getIt.get<CashOrderViewModel>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String savedToken = CacheService.getData(key: CacheConstants.userToken);
    String token = "Bearer $savedToken";

   paymentData =
    ModalRoute.of(context)?.settings.arguments as PaymentNavigationItems;

    cashOrderViewModel.getCashOrder(paymentData.paymentCheckoutRequest, token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cashOrderViewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "Payment",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<CashOrderViewModel, CashOrderState>(
                  builder: (context, state) {
                    if (state is CashOrderLoadingState) {
                      return const Expanded(child: SkeletonBody());
                    } else if (state is CashOrderSuccessState) {
                      List<CartItemEntity>? orderItems=paymentData.orderItems;
                      String? city=paymentData.paymentCheckoutRequest.shippingAddress?.city;
                      String? street=paymentData.paymentCheckoutRequest.shippingAddress?.street;
                      num? totalPrice=state.response?.order?.totalPrice;
                      return TrackWidget(orderItems: orderItems, city: city, street:street, totalPrice: totalPrice, isCash:true,);
                    } else if (state is CashOrderErrorState) {
                      return Container(
                        color: Colors.red,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
