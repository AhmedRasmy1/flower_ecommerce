import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomText(
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
      textAlign: TextAlign.justify,
    );
  }
}
