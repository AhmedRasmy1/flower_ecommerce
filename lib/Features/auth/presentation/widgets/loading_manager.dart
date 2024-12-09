import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingManager extends StatelessWidget {
  const CustomLoadingManager(
      {super.key, required this.child, required this.isLoading});

  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: const Center(
                child: SpinKitFadingFour(
                  color: ColorManager.lightPink,
                ),
              ),
            )
        ],
      ),
    );
  }
}
