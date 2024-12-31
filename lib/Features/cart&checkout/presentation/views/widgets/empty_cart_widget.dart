import '../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  'assets/images/empty_cartt.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.whoops,
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
                  AppLocalizations.of(context)!.emptyCartMessage,
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
