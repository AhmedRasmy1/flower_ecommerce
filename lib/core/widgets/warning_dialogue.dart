import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/utils/app_assets.dart';
import 'package:flower_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

void showWarningDialogue({
  required String message,
  required void Function() onPressed,
  required BuildContext context,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ColorManager.white,
      actionsAlignment: MainAxisAlignment.center,
      title: Row(
        children: [
          Image.asset(
            AppAssets.warningSignImage,
            width: 40,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Heads Up!",
            style: const TextStyle().copyWith(
              color: ColorManager.black,
              fontSize: AppSize.s18,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      content: Text(
        message,
        style: const TextStyle().copyWith(
          color: ColorManager.black,
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        SizedBox(
          width: 110,
          child: CustomElevatedButton(
            buttonColor: ColorManager.black,
            title: "Cancel",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: 110,
          child: CustomElevatedButton(
            buttonColor: ColorManager.pink,
            title: "Ok",
            onPressed: () {
              onPressed();
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ],
    ),
  );
}
