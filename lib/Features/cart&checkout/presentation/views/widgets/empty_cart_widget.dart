import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.emptyCartImage,
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Whoops!',
                  style: const TextStyle().copyWith(
                    fontSize: 45,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Your cart is empty\n Add something and make me happy:)",
                  style: const TextStyle().copyWith(
                    fontSize: AppSize.s18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
