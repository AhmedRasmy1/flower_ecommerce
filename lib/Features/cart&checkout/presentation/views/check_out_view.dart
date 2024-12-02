import 'package:flower_ecommerce/Features/cart&checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CheckOutViewBody(),
      ),
    );
  }
}
