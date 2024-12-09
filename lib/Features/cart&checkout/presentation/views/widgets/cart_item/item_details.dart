import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle().copyWith(
            fontWeight: FontWeight.w500,
            fontSize: AppSize.s16,
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle().copyWith(
            fontWeight: FontWeight.w400,
            fontSize: AppSize.s13,
            color: ColorManager.grey,
          ),
        ),
      ],
    );
  }
}
