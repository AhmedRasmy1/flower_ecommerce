import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/home_categories.dart';

import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/color_manager.dart';

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({
    super.key,
    this.categories,
  });

  final List<HomeCategories>? categories;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: context.screenHeight * 0.16,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories!.length,
          itemBuilder: (context, index) {
            var categoryItem = categories![index];
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(context.screenHeight * 0.03),
                    width: context.screenHeight * 0.10,
                    height: context.screenHeight * 0.10,
                    decoration: const BoxDecoration(
                      color: ColorManager.lightPink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: categoryItem.image!,
                        placeholder: (context, url) => const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: ColorManager.pink,
                            strokeWidth: 2,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categoryItem.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w400,
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
