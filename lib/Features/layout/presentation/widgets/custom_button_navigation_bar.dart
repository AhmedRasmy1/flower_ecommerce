import 'package:flutter/material.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/color_manager.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.home, 0, currentIndex),
          label: AppStrings.home,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.categories, 1, currentIndex),
          label: AppStrings.categories,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.cart, 2, currentIndex),
          label: AppStrings.cart,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.profile, 3, currentIndex),
          label: AppStrings.profile,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
     type:  BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.pink,
    );
  }
}
