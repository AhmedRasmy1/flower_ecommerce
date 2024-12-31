import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'custom_bestseller_container.dart';
import 'custom_card.dart';
import 'custom_header.dart';
import 'custom_location.dart';
import 'custom_occasion_container.dart';
import 'custom_search_field.dart';

class SkeletonHome extends StatelessWidget {
  const SkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                CustomAppBar(
                  image: AssetsManager.appLogo,
                  title: AppStrings.flowry,
                  color: ColorManager.pink,
                ),
                SizedBox(
                  width: AppSize.s16,
                ),
                Expanded(child: CustomTextFieldForSearch())
              ],
            ),
            const SizedBox(height: AppSize.s16),
            const CustomLocation(
              icon: AssetsManager.locationIcon,
              arrow: AssetsManager.arrowIcon,
            ),
            const SizedBox(height: AppSize.s24),
            const CustomHeader(title: AppStrings.discover),
            const SizedBox(height: AppSize.s16),
            const CustomCard(),
            const SizedBox(height: AppSize.s24),
            CustomHeader(
              title: AppStrings.categories,
              viewAll: AppStrings.viewAll,
              onTap: () {
                /// Navigate to CategoriesView
              },
            ),
            const SizedBox(height: AppSize.s16),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: context.screenHeight * 0.16,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.all(context.screenHeight * 0.03),
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
                                    imageUrl:
                                        'https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png')),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Flowers',
                            style: TextStyle(
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
            ),
            const SizedBox(height: AppSize.s24),
            const CustomHeader(
              title: AppStrings.bestSeller,
              viewAll: AppStrings.viewAll,
            ),
            const SizedBox(height: AppSize.s16),
            const CustomBestSellerContainer(
              bestSeller: [],
            ),
            const SizedBox(height: AppSize.s16),
            const CustomHeader(
              title: AppStrings.occasion,
              viewAll: AppStrings.viewAll,
            ),
            const SizedBox(height: AppSize.s16),
            const CustomOccasionContainer(
              occasion: [],
            )
          ],
        ),
      ),
    );
  }
}
