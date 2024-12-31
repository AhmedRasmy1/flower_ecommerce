import 'dart:ui';
import '../../../../core/resources/routes_manager.dart';

import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: context.screenHeight * 0.45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10, // Adjust the item count as needed
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // Base image
                      Image.asset(
                        AssetsManager.graduationImage,
                        width: context.screenWidth * 0.65,
                        height: context.screenHeight * 0.45,
                        fit: BoxFit.cover,
                      ),
                      // Radial blur effect
                      Positioned.fill(
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return RadialGradient(
                              center: Alignment.center,
                              radius: 0.8,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                              stops: const [0.4, 1.0],
                            ).createShader(rect);
                          },
                          blendMode: BlendMode.dstIn,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      // Content on top of the blurred card
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.04,
                            vertical: context.screenHeight * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.graduation,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: FontSize.s18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                AppLocalizations.of(context)!
                                    .celebrateSpecialDay,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: FontSize.s14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      RoutesManager.editProfileRoute); //todo!
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.screenWidth * 0.06,
                                    vertical: context.screenHeight * 0.015,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.pink,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.giftNow,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
