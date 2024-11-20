import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_bestseller_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_card.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_category_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_header.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_location.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_occasion_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_search_field.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p8,
            right: AppPadding.p16,
            left: AppPadding.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                SizedBox(height: AppSize.s16),
                CustomLocation(
                  icon: AssetsManager.locationIcon,
                  address: AppStrings.address,
                  arrow: AssetsManager.arrowIcon,
                ),
                SizedBox(height: AppSize.s24),
                CustomHeader(title: AppStrings.discover),
                SizedBox(height: AppSize.s16),
                CustomCard(),
                SizedBox(height: AppSize.s24),
                CustomHeader(
                  title: AppStrings.categories,
                  viewAll: AppStrings.viewAll,
                ),
                SizedBox(height: AppSize.s16),
                CustomCategoryContainer(),
                SizedBox(height: AppSize.s24),
                CustomHeader(
                  title: AppStrings.bestSeller,
                  viewAll: AppStrings.viewAll,
                ),
                SizedBox(height: AppSize.s16),
                CustomBestSellerContainer(),
                SizedBox(height: AppSize.s16),
                CustomHeader(
                  title: AppStrings.occasion,
                  viewAll: AppStrings.viewAll,
                ),
                SizedBox(height: AppSize.s16),
                CustomOccasionContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
