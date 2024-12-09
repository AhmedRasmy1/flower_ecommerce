import 'paymentwidget.dart';
import 'package:flutter/material.dart';

class BuildPaymentWidget extends StatefulWidget {
  const BuildPaymentWidget({super.key});

  @override
  State<BuildPaymentWidget> createState() => _BuildPaymentWidgetState();
}

class _BuildPaymentWidgetState extends State<BuildPaymentWidget> {
  int selectedOption = 1; // القيمة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          PaymentOptionTile(
            option: 'Cash on delivery',
            isSelected: selectedOption == 1,
            onTap: () {
              setState(() {
                selectedOption = 1;
              });
            },
          ),
          const SizedBox(height: 8),
          PaymentOptionTile(
            option: 'Credit card',
            isSelected: selectedOption == 2,
            onTap: () {
              setState(() {
                selectedOption = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
