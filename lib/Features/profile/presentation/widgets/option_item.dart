import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final String? trailingText;
  final bool imageIconExists;

  const OptionItem(
      {super.key,
      this.icon,
      required this.text,
      this.trailingText,
      required this.imageIconExists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  if (icon != null) Icon(icon, color: Colors.black),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(color: Colors.pink),
            ),
          if (imageIconExists)
            const ImageIcon(AssetImage("assets/images/side_arrow.png"))
        ],
      ),
    );
  }
}
