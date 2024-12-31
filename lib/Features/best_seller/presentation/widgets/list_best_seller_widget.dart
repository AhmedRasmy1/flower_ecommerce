import '../../domain/entities/best_seller_entity.dart';
import 'best_seller_item_widget.dart';
import 'package:flutter/material.dart';

class ListBestSellerGrid extends StatelessWidget {
  const ListBestSellerGrid({required this.items, super.key});
  final List<BestSellerEntity>? items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.56,
      ),
      itemBuilder: (context, index) {
        final item = items?[index];
        return BestSellerItem(bestSellerEntity: item);
      },
    );
  }
}
