import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/app_constants.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    movedToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.imagesFlower,
              width: context.screenWidth / AppSize.w2_5,
              height: context.screenWidth / AppSize.w2_5,
            ),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          const Text(AppStrings.appName,
              style: TextStyle(
                  fontSize: 35,
                  color: ColorManager.pink,
                  fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  void movedToNextPage() {
    Future.delayed(
      const Duration(seconds: AppConstants.splashDelay),
      () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesManager.registerRoute, (route) => false);
        }
      },
    );
  }
}
