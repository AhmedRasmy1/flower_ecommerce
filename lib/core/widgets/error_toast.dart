import '../resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void showErrorToast({
  required BuildContext context,
  required String message,
}) {
  MotionToast.error(
    opacity: 1,
    position: MotionToastPosition.bottom,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    animationDuration: const Duration(microseconds: 2500),
    description: Text(
      message,
      maxLines: 4,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: const TextStyle().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
      ),
    ),
    layoutOrientation: TextDirection.ltr,
    animationType: AnimationType.fromLeft,
    width: MediaQuery.sizeOf(context).width * 0.92,
    height: 100,
  ).show(context);
}
