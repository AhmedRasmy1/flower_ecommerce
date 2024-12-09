import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OrderInfoRow extends StatelessWidget {
  const OrderInfoRow({
    super.key,
    required this.title,
    required this.value,
    this.style,
  });
  final String title;
  final String value;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ??
              const TextStyle(
                fontSize: AppSize.s16,
                fontWeight: FontWeight.w400,
                color: ColorManager.grey,
              ),
        ),
        Text(
          value,
          style: style ??
              const TextStyle(
                fontSize: AppSize.s16,
                fontWeight: FontWeight.w400,
                color: ColorManager.grey,
              ),
        ),
      ],
    );
  }
}
