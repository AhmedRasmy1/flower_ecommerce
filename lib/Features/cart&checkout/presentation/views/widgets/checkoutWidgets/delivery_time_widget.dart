import '../../../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class buildDeliveryTimeSection extends StatelessWidget {
  const buildDeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Schedule',
                style: TextStyle(
                    color: ColorManager.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const Row(children: [
          Icon(Icons.access_time),
          SizedBox(
            width: 8,
          ),
          Text('Instant'),
          Text(
            ' Arrive by 03 Sep 2024, 11:00 AM',
            style: TextStyle(fontSize: 14, color: Color(0XFF0CB359)),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
