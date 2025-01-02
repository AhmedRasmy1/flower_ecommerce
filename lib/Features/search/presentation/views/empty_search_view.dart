import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Image.asset(
          AssetsManager.noBouqeut,
          height: 180,
          width: 180,
        ),
        Container(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p8,
              right: AppPadding.p16,
              left: AppPadding.p16,
            ),
            child: Text(
              textAlign: TextAlign.center,
              "No Products Found",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
          ),
        )
      ],
    );
  }
}
