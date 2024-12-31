import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color,
    TextDecoration? textDecoration) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: textDecoration);
}

//return regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    Color? color,
    TextDecoration? textDecoration}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, color, textDecoration);
}

// return light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    Color? color,
    TextDecoration? textDecoration}) {
  return _getTextStyle(
      fontSize, FontWeightManager.light, color, textDecoration);
}

// return bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    Color? color,
    TextDecoration? textDecoration}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, textDecoration);
}

// return semi bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    Color? color,
    TextDecoration? textDecoration}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, color, textDecoration);
}

// return medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    Color? color,
    TextDecoration? textDecoration}) {
  return _getTextStyle(
      fontSize, FontWeightManager.medium, color, textDecoration);
}
