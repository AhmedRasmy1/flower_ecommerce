import '../../../../core/widgets/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    this.imgCover,
    this.title,
    this.priceAfterDiscount,
    this.price,
    required this.productId,
  });
  final String? productId;
  final String? imgCover;
  final String? title;

  final num? priceAfterDiscount;
  final num? price;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "$productId =================================================================");
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: ColorManager.lightGrey3),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: CustomImage(
                    url: imgCover ?? '',
                    width: double.infinity,
                    placeholder: Skeletonizer(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: ColorManager.lightGrey3.withAlpha(50),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.5, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularStyle(
                        fontSize: AppSize.s12, color: ColorManager.blackName),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.currencyEGP,
                        style: getBoldStyle(fontSize: AppSize.s14),
                      ),
                      const SizedBox(
                        width: AppSize.s5,
                      ),
                      Text(
                        priceAfterDiscount.toString(),
                        style: getBoldStyle(fontSize: AppSize.s14),
                      ),
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      Text(
                        price.toString(),
                        style: getRegularStyle(
                          fontSize: AppSize.s12,
                          color: ColorManager.blackPrice,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      Text(
                        calculateDiscountPercentage(
                                priceAfterDiscount!.toDouble(),
                                price!.toDouble())
                            .toString()
                            .substring(0, 2),
                        style: getRegularStyle(
                          fontSize: AppSize.s12,
                          color: ColorManager.discountRate,
                        ),
                      ),
                      Text(
                        '%',
                        style: getRegularStyle(
                          fontSize: AppSize.s12,
                          color: ColorManager.discountRate,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AddToCartButton(
                productId: productId.toString(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

double calculateDiscountPercentage(double priceAfterDiscount, double price) {
  return ((priceAfterDiscount / price) * 100);
}
