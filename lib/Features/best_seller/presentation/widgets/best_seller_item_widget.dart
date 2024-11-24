import '../../domain/entities/best_seller_entity.dart';
import '../usefull_methods/precentage_calculate.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../usefull_methods/part_title.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({required this.bestSellerEntity, super.key});

  final BestSellerEntity? bestSellerEntity;

  @override
  Widget build(BuildContext context) {
    String percentage = percentageCalculate(bestSellerEntity?.price ?? 0,
        bestSellerEntity?.priceAfterDiscount ?? 0);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        side: const BorderSide(color: ColorManager.lightGrey3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              bestSellerEntity?.imgCover ?? "",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTitlePart(bestSellerEntity?.title ?? ""),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSize.s4),
                  Row(
                    children: [
                      Text(
                        "${AppStrings.countryCurrency} ${bestSellerEntity?.priceAfterDiscount.toString()}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: AppSize.s8),
                      Text(
                        bestSellerEntity!.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: ColorManager.placeHolderColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: AppSize.s8),
                      Text(
                        percentage,
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorManager.percentageColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon:
                    const Icon(Icons.shopping_cart, color: ColorManager.white),
                label: const Text(
                  AppStrings.addToCart,
                  style: TextStyle(color: ColorManager.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
