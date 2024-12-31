import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void showSuccessToast({
  required BuildContext context,
  required String message,
  required String title,
  MotionToastPosition? position,
}) {
  MotionToast.success(
    position: position ?? MotionToastPosition.bottom,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    opacity: 1,
    animationDuration: const Duration(microseconds: 2500),
    title: Text(
      title,
      style: const TextStyle().copyWith(
        fontSize: AppSize.s18,
        fontWeight: FontWeight.w600,
        color: ColorManager.white,
      ),
    ),
    description: Text(
      message,
      style: const TextStyle().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
      ),
    ),
    layoutOrientation: TextDirection.ltr,
    animationType: AnimationType.fromLeft,
    width: MediaQuery.sizeOf(context).width * 0.92,
  ).show(context);
}
