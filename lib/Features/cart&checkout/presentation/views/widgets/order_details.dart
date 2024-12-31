import 'order_info_row.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.total,
  });
  final double total;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderInfoRow(
          title: AppLocalizations.of(context)!.subTotal,
          value: "${total.toStringAsFixed(2)}\$",
        ),
        const SizedBox(
          height: 8,
        ),
        OrderInfoRow(
          title: AppLocalizations.of(context)!.deliveryFee,
          value: r'10$',
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 0,
          thickness: 0.5,
          color: ColorManager.offWhite,
        ),
        const SizedBox(
          height: 8,
        ),
        OrderInfoRow(
          title: AppLocalizations.of(context)!.total,
          value: "${(total + 10).toStringAsFixed(2)}\$",
          style: const TextStyle(
            fontSize: AppSize.s18,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
