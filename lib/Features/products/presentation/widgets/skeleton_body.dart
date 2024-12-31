import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'cart_product.dart';

class SkeletonBody extends StatelessWidget {
  const SkeletonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 3 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .6),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CartProduct(
              productId: null,
              title: '',
              imgCover:
                  'https://flower.elevateegy.com/uploads/39c641a6-4ec4-421a-8f55-5d8f5eeba5c3-flowers.png',
              price: 555,
              priceAfterDiscount: 66,
            );
          },
        ),
      ),
    );
  }
}
