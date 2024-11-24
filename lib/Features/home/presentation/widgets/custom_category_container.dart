import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
                    padding: EdgeInsets.all(context.screenHeight * 0.03),
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
                        child: SvgPicture.asset('assets/images/Gift.svg')),
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
