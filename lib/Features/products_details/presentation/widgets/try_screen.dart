import '../../../../core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutesManager.productDetailsRoute,
              arguments: '673e2d1b1159920171828146',
            );
          },
          child: const Text(
            "Navigate to product details screen",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
