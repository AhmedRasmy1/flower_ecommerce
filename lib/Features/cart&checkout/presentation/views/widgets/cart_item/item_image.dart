import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: ColorManager.lightPink,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          imageUrl: image,
          width: 66,
          height: 87,
        ),
      ),
    );
  }
}
