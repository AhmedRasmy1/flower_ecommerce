import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final String addressType;
  final String addressDetails;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onEditTap;

  const AddressTile({
    super.key,
    required this.addressType,
    required this.addressDetails,
    required this.isSelected,
    this.onTap,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio<bool>(
                      activeColor: Colors.pink,
                      value: true,
                      groupValue: isSelected,
                      onChanged: (value) {
                        if (onTap != null) {
                          onTap!();
                        }
                      },
                    ),
                    Text(
                      addressType,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.pink : Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onEditTap,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              addressDetails,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
