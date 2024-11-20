import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: context.screenHeight * 0.12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 75,
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/floweeeeeeeeeeeer.jpg'),
                      ),
                      color: ColorManager.lightPink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
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
    );
  }
}
