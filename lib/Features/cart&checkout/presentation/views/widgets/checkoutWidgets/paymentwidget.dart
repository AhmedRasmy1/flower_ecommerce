import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class PaymentOptionTile extends StatelessWidget {
  final String option;
  final bool isSelected;
  const PaymentOptionTile({
    Key? key,
    required this.option,
    required this.isSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(

        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Radio<int>(
            value: isSelected ? 1 : 0,
            groupValue: isSelected ? 1 : null,
            activeColor: ColorManager.pink,
            onChanged: null, // Disabled, handled by GestureDetector
          ),
          Expanded(child: Text(option)),
        ],
      ),
    );
  }
}

