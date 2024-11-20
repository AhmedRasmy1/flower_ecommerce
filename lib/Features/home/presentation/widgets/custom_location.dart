// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flower_ecommerce/core/resources/values_manager.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({
    super.key,
    this.icon,
    this.address,
    this.arrow,
  });
  final String? icon;
  final String? address;
  final String? arrow;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          width: AppSize.s20,
          height: AppSize.s20,
          icon!,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(width: AppSize.s5),
        Text(
          address!,
          style: const TextStyle(
            fontSize: AppSize.s16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: AppSize.s5),
        SvgPicture.asset(
          width: AppSize.s20,
          height: AppSize.s20,
          arrow!,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }
}
