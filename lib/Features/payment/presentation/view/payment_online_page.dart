import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/Features/cart&checkout/presentation/views/useful_methods/get_total_func.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_methods/payment_navegation_items.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_widgets/payment_button.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_widgets/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../products/presentation/widgets/skeleton_body.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../../data/model/response/cash_order_response/OrderItems.dart';
import '../payment_checkout_view_model/payment_checkout_cubit.dart';
import '../payment_checkout_view_model/payment_checkout_state.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PaymentOnlinePage extends StatefulWidget {
  const PaymentOnlinePage({super.key});

  @override
  State<PaymentOnlinePage> createState() => _PaymentOnlinePageState();
}

class _PaymentOnlinePageState extends State<PaymentOnlinePage> {


  late PaymentCheckoutViewModel paymentCheckoutViewModel;
  late final PaymentNavigationItems paymentData;
  String? checkoutUrl;

  @override
  void initState() {
    super.initState();
    paymentCheckoutViewModel = getIt.get<PaymentCheckoutViewModel>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String savedToken = CacheService.getData(key: CacheConstants.userToken);
    String token = "Bearer $savedToken";

    paymentData =
    ModalRoute.of(context)?.settings.arguments as PaymentNavigationItems;

    paymentCheckoutViewModel.getPaymentCheckout(paymentData.paymentCheckoutRequest, token);
  }
  Future<void> openInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open the URL: $url')),
      );
    }
  }
  //////////////////////////////////

  ////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentCheckoutViewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "Track order",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<PaymentCheckoutViewModel, PaymentCheckoutState>(
                  builder: (context, state) {
                    if (state is PaymentCheckoutLoadingState) {
                      return const Expanded(child: SkeletonBody());
                    } else if (state is PaymentCheckoutSuccessState) {

                      checkoutUrl = state.response?.session?.url;
                      List<CartItemEntity>? orderItems=paymentData.orderItems;
                      String? city=paymentData.paymentCheckoutRequest.shippingAddress?.city;
                      String? street=paymentData.paymentCheckoutRequest.shippingAddress?.street;
                      num? totalPrice=getTotal(paymentData.orderItems);



                     return TrackWidget(orderItems: orderItems, city: city, street: street, totalPrice: totalPrice, isCash: false,paymentUrl:checkoutUrl );


                    } else if (state is PaymentCheckoutErrorState) {
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
