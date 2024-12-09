import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        backgroundColor: Colors.pink, // Adjust to match your theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
            
            1. By using this application, you agree to follow all rules and policies.
            2. Orders placed are subject to availability.
            3. Payments are non-refundable after confirmation.
            4. We reserve the right to update these terms at any time.

            Please contact support for more details.
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
