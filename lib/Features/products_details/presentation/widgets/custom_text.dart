import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;

  CustomText(
      {required this.text,
        this.color,
         this.fontWeight,
        this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
