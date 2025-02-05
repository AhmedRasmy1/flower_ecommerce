import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_constants.dart';
import 'core/functions/extenstions.dart';
import 'core/resources/assets_manager.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/strings_manager.dart';
import 'core/resources/values_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';

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
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Image.asset(
                        'assets/images/splashLogo.png',
                        width: AppSize.s54 * value,
                        height: AppSize.s54 * value,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1500),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Text(
                            'Flowery',
                            style: TextStyle(
                              fontSize: 70,
                              color: ColorManager.pink,
                              fontWeight: FontWeight.w800,
                              fontFamily: GoogleFonts.eduNswActFoundation().fontFamily,
                            ),
                          ),
                        );

                      },
                      onEnd: () {
                        setState(() {

                        });
                      },

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