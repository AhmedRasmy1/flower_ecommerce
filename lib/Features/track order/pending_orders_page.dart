import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/widgets/custom_app_bar.dart';

class PendingOrdersPage extends StatelessWidget {
  const PendingOrdersPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              CustomAppBar(
                onTap: () => Navigator.pop(context),
                title: 'Track order',
              ),
              Center(
                  child: Lottie.asset(
                    AssetsManager.pending,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                  )),
              SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.pink,
                      ),
                    ),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}