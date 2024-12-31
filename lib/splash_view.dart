import 'core/resources/strings_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_constants.dart';
import 'core/functions/extenstions.dart';
import 'core/resources/assets_manager.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/values_manager.dart';

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
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsManager.background,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: AppSize.s100,
              ),
              Center(
                child: Image.asset(
                  'assets/images/splashLogo.png',
                  width: AppSize.s54,
                  height: AppSize.s54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.flowry,
                      style: TextStyle(
                        fontSize: 50,
                        color: ColorManager.pink,
                        fontWeight: FontWeight.w800,
                        fontFamily:
                            GoogleFonts.eduNswActFoundation().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void movedToNextPage() {
    Future.delayed(
      const Duration(seconds: AppConstants.splashDelay),
      () {
        final rememberMe =
            CacheService.getData(key: CacheConstants.isRememberMe);
        final isRemeberMe = rememberMe != null && rememberMe == true;
        if (mounted) {
          Navigator.pushReplacementNamed(
            context,
            isRemeberMe ? RoutesManager.layoutRoute : RoutesManager.loginRoute,
          );
        }
      },
    );
  }
}
// commit