import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final String addressType;
  final String addressDetails;
  final bool isSelected;
  final VoidCallback? onTap;

  const AddressTile({
    Key? key,
    required this.addressType,
    required this.addressDetails,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(
          color:  Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Row(
          children: [
            Radio<bool>(
              activeColor: Colors.pink,
              value: true,
              groupValue: isSelected ? true : null,
              onChanged: (value) {

                if (onTap != null) {
                  onTap!();
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(addressType),
                Text(addressDetails),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}