import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentButton extends StatefulWidget {
   PaymentButton({super.key,required this.checkoutUrl});

  String? checkoutUrl;

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {

   Future<void> openInBrowser(String url) async {
     final uri = Uri.parse(url);
     if (await canLaunchUrl(uri)) {
       await launchUrl(
         uri,
         mode: LaunchMode.externalApplication,
       );
     } else {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Could not open the URL: $url')),
       );
     }
   }

   Future<void> launchShopPolicy(String url) async {
     var webUrl = url;

     try {
       await launchUrl(Uri.parse(webUrl));
     } catch (e) {
       print(e.toString());
     }
   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (widget.checkoutUrl != null) {
            launchShopPolicy(widget.checkoutUrl!);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No URL available to open.')),
            );
          }
        },
        child: const Text("Open Payment Page"),
      ),
    );
  }
}
