import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.notifications_none,
              size: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "New offer",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 4,
            ),
            Image(
              image: AssetImage("assets/images/Heart-eyes.png"),
              width: 16,
              height: 16,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Lorem ipsum dolor sit amet consectetur Tristique et "
            "mauris sem congue in felis id nec. Amet sed morbi "
            "bibendum vestibulum.",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorManager.grey),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
      ],
    );
  }
}
