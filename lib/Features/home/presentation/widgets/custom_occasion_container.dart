import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_ecommerce/Features/home/data/models/occasion.dart';
import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomOccasionContainer extends StatelessWidget {
  const CustomOccasionContainer({super.key, required this.occasion});
  final List<Occasion> occasion;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: context.screenHeight * 0.26,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: occasion.length,
          itemBuilder: (context, index) {
            final occasionItem = occasion[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: occasionItem.image ?? '',
                    width: context.screenWidth * 0.4,
                    height: context.screenHeight * 0.2,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    occasionItem.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
