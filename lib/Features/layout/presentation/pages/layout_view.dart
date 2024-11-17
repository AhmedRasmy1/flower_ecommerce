import 'package:flutter/material.dart';
import '../../../../core/resources/app_constants.dart';
import '../widgets/custom_button_navigation_bar.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppConstants.viewOptions[_selectIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
