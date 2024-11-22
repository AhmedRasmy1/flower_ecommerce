import 'package:flutter/material.dart';
import '../../../../core/resources/app_constants.dart';
import '../widgets/custom_button_navigation_bar.dart';

int selectIndex = 0;

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppConstants.viewOptions[selectIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: selectIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
