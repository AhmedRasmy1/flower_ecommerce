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
              top: AppPadding.p8, right: AppPadding.p16, left: AppPadding.p16),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
