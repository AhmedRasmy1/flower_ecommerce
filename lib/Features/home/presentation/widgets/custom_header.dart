import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.title,
    this.viewAll,
  });
  final String? title;
  final String? viewAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (viewAll != null)
          TextButton(
            onPressed: () {},
            child: Text(
              viewAll!,
              style: const TextStyle(
                  fontSize: FontSize.s14,
                  color: ColorManager.pink,
                  decoration: TextDecoration.underline),
            ),
          ),
      ],
    );
  }
}
