import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OrderSummeryItemImage extends StatelessWidget {
  const OrderSummeryItemImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          width: 57,
          height: 60,
        ),
      ),
    );
  }
}
