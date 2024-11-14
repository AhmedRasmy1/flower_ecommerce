import 'package:flower_ecommerce/Features/auth/presentation/view_model/signup_view_model/signup_cubit.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/cashed_data_shared_preferences.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  String? _selectedValue;
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.gender,
          style:
          getSemiBoldStyle(color: ColorManager.grey, fontSize: AppSize.s18),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
              activeColor: ColorManager.pink,
              value: 'female',
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value;
                  _isActive =!_isActive;
                  SharedData.setData(
                      key: StringCache.selectGender, value: value);
                  print(SharedData.getData(key: StringCache.selectGender));
                });
              },
            ),
            Text(
              AppStrings.female,
              style: getLightStyle(
                  color: _isActive ? ColorManager.black : ColorManager.grey,
                  fontSize: AppSize.s16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
              activeColor: ColorManager.pink,
              value: 'male',
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value;
                  _isActive =!_isActive;
                  SharedData.setData(
                      key: StringCache.selectGender, value: value);
                  print(SharedData.getData(key: StringCache.selectGender));
                });
              },
            ),
            Text(
              AppStrings.male,
              style: getLightStyle(
                  color: !_isActive ? ColorManager.black : ColorManager.grey,
                  fontSize: AppSize.s16),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

