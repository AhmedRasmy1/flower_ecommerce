import '../../../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class PaymentOptionTile extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap; // Callback لتبديل الحالة
  const PaymentOptionTile({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // للتبديل عند النقر
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: isSelected ? ColorManager.pink : Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // لجعل الـ Radio على اليمين
          children: [
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected ? ColorManager.pink : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Radio<int>(
              value: 1,
              groupValue: isSelected ? 1 : 0,
              activeColor: ColorManager.pink,
              onChanged: (value) => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}
