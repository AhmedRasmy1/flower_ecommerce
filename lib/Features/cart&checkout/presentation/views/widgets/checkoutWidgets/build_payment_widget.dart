import 'package:flower_ecommerce/Features/cart&checkout/presentation/views/widgets/checkoutWidgets/paymentwidget.dart';
import 'package:flutter/material.dart';
class BuildPaymentWidget extends StatefulWidget {
  const BuildPaymentWidget({Key? key}) : super(key: key);
  @override
  State<BuildPaymentWidget> createState() => _BuildPaymentWidgetState();
}
class _BuildPaymentWidgetState extends State<BuildPaymentWidget> {
  int selectedOption = 1; // Adjusted to be a member variable
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16), // Add some space
          GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = 1; // Update selected option
              });
            },
            child: PaymentOptionTile(
              option: 'Cash on delivery',
              isSelected: selectedOption == 1,
            ),
          ),
          const SizedBox(height: 8), // Space between options
          GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = 2; // Update selected option
              });
            },
            child: PaymentOptionTile(
              option: 'Credit card',
              isSelected: selectedOption == 2,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
