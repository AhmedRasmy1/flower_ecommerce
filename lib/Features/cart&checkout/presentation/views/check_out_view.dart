import 'package:flower_ecommerce/Features/cart&checkout/presentation/views/useful_methods/get_total_func.dart';
import 'package:flower_ecommerce/Features/payment/data/model/request/payment_checkout_request.dart';
import 'package:flower_ecommerce/Features/payment/data/model/request/shipping_address.dart';
import 'package:flower_ecommerce/Features/payment/presentation/useful_methods/payment_navegation_items.dart';
import 'package:flower_ecommerce/Features/payment/presentation/view/payment_cash_page.dart';

import '../../../payment/presentation/view/payment_online_page.dart';
import 'widgets/checkoutWidgets/addresswidget.dart';
import 'widgets/checkoutWidgets/build_payment_widget.dart';
import 'widgets/checkoutWidgets/delivery_time_widget.dart';
import 'widgets/checkoutWidgets/order_summary_widget.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../manager/checkout/checkout_state.dart';
import '../manager/checkout/checkout_viewmodel.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  List<CartItemEntity> cartList = [];
  late CheckoutViewModel _checkoutViewModel;
  bool _isGift = false;
  int? _selectedAddressIndex;
   String city="";
   String street="";
   String phone="";
  late String _paymentOption;
  @override
  void initState() {
    super.initState();
    _checkoutViewModel = getIt<CheckoutViewModel>();
    _paymentOption = "cash";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is List<CartItemEntity> && arguments.isNotEmpty) {
      setState(() {
        cartList = arguments;
      });
    } else {
      debugPrint('No cart items received or arguments are not valid');
    }

    var savedToken = CacheService.getData(key: CacheConstants.userToken) ?? '';
    _checkoutViewModel.getUserAddresses("Bearer $savedToken");
  }

  @override
  Widget build(BuildContext context) {
    double total = getTotal(cartList);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9, left: 16),
                child: CustomAppBar(
                  title: 'Checkout',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: buildDeliveryTimeSection(),
              ),
              const Divider(thickness: 24, color: Color(0xFFEAEAEA)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16),
                child: buildDeliveryAddressSection(),
              ),
              const Divider(thickness: 24, color: Color(0xFFEAEAEA)),
              const SizedBox(height: 10),
              BuildPaymentWidget(
                onPaymentOptionChanged: (option) {
                  setState(() {
                    _paymentOption = option;
                    print(_paymentOption);
                  });
                },
              ),

              const Divider(thickness: 24, color: Color(0xFFEAEAEA)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16),
                child: buildIsGiftSection(),
              ),
              const Divider(thickness: 24, color: Color(0xFFEAEAEA)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: buildOrderSummary(total),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildCheckoutButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDeliveryAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery address',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BlocProvider(
          create: (_) => _checkoutViewModel,
          child: BlocBuilder<CheckoutViewModel, CheckoutState>(
            builder: (context, state) {
              if (state is LoadingCheckoutState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SuccessCheckoutState) {
                final addresses = state.addressResponse?.addresses ?? [];

                return Column(
                  children: addresses.map((address) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAddressIndex = addresses.indexOf(address);
                          city=address.city ??"";
                          street=address.street??"";
                          phone=address.phone??"";
                          });
                      },
                      child: AddressTile(
                        addressType: address.street ?? "Unnamed Address",
                        addressDetails: address.city ?? "No details available",
                        isSelected:
                            _selectedAddressIndex == addresses.indexOf(address),
                      ),
                    );
                  }).toList(),
                );
              } else if (state is ErrorCheckoutState) {
                return Center(
                  child: Text(
                    "Failed to load addresses: ${state.exception}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(child: Text("No addresses available"));
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        // Add New Address Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.addAddressView);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              ' + Add new',
              style: TextStyle(color: ColorManager.pink),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildIsGiftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              value: _isGift,
              onChanged: (value) {
                setState(() {
                  _isGift = value;
                });
              },
            ),
            const Text(
              'It is a gift',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (_isGift) ...[
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone number',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
          buttonColor: ColorManager.pink,
          title: 'Place Order',
          onPressed: () {

            ShippingAddress userShippingAddress=ShippingAddress(street:street ,phone:phone ,city:city );

            PaymentCheckoutRequest paymentRequest=PaymentCheckoutRequest(shippingAddress: userShippingAddress);
            PaymentNavigationItems paymentNavigationItems=PaymentNavigationItems(paymentCheckoutRequest: paymentRequest, orderItems: cartList);
            if (_paymentOption=="cash"){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => const PaymentCashPage(),
                     settings: RouteSettings(arguments:paymentNavigationItems)));
           }
           else if(_paymentOption=="online"){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => const PaymentOnlinePage(),
                     settings: RouteSettings(arguments:paymentNavigationItems)));
           }
           else {

           }

          }),
    );
  }


}
