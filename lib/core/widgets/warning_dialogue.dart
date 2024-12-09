import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            'assets/images/warining_icon.png',
            width: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            AppLocalizations.of(context)!.headsUp,
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
            title: AppLocalizations.of(context)!.cancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: 110,
          child: CustomElevatedButton(
            buttonColor: ColorManager.pink,
            title: AppLocalizations.of(context)!.ok,
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
