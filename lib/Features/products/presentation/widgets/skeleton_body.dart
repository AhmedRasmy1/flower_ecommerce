import '../../domain/entities/ProductsEntities.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'cart_product.dart';

class SkeletonBody extends StatelessWidget {
  const SkeletonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .6),
          itemCount: 6,
          itemBuilder: (context, index) {
            return CartProduct(
              productsEntities: productsEntities,
            );
          },
        ),
      ),
    );
  }
}

ProductsEntities productsEntities = ProductsEntities(
    title: 'dddddddd',
    slug: 'sss',
    quantity: 1000,
    priceAfterDiscount: 100,
    price: 55,
    occasion: 'dddd',
    imgCover:
        'https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png',
    images: [
      'https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png',
      'https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png',
      'https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png',
    ],
    description: 'kkkkkk',
    category: 'jjjj',
    id: 'jjjjjjjjjj');
