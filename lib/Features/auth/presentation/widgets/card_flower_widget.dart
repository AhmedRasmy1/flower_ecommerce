import 'package:flutter/material.dart';

class FlowerCard extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final String imageUrl;

  const FlowerCard({
    super.key,
    required this.title,
    required this.price,
    required this.discount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Flower.svg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text('EGP $price', style: const TextStyle(color: Colors.green)),
          Text('$discount% OFF', style: const TextStyle(color: Colors.red)),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Add to cart"),
          ),
        ],
      ),
    );
  }
}
