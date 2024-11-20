import 'dart:ui';
import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/font_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Adjust the item count as needed
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.topLeft,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Image.asset(
                    AssetsManager.graduationImage,
                    width: context.screenWidth * 0.59,
                    height: context.screenHeight * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: context.screenHeight * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.02,
                              vertical: context.screenHeight * 0.011,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  AppStrings.graduation,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSize.s14,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        color: ColorManager.black,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.015),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.screenWidth * 0.06,
                                      vertical: context.screenHeight * 0.012,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Gift now",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
