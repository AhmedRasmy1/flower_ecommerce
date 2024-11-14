import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({
    super.key,
    required this.message,
    required this.userAccess,
    required this.routeName,
    this.color,
  });

  final String message;
  final String userAccess;
  final String routeName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: FontSize.s16,
              color: ColorManager.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
          ),
          child: Text(
            userAccess,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: color ?? ColorManager.pink,
              fontSize: FontSize.s16,
              color: color ?? ColorManager.pink,
              fontWeight: FontWeightManager.semiBold,
              height: 2.0,
              decorationThickness: 2.0,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
