import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          8,
        ),
        child: Row(
          children: [Image.asset(name)],
        ),
      ),
    );
  }
}
