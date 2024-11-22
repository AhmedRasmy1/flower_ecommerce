import 'package:flutter/material.dart';
import '../widgets/category_tap_bar.dart';
import '../widgets/custom_search.dart';
import '../widgets/filter_button.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomSearch(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CategoryTapBar(),
                  FilterButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
