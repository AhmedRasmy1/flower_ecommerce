import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/resources/color_manager.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_card_details.dart';
import '../../core/widgets/custom_elevated_button.dart';

class SkeletonTrack extends StatelessWidget {
  const SkeletonTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CustomAppBar(
            onTap: () => Navigator.pop(context),
            title: 'Track order',
          ),
          Text(
            'Estimated arrival',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'arrivalTime',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Divider(height: 20, thickness: 1),
          CustomCardDetails(
              phone: 'driver?.phone ?? ' '',
              subTitle: 'Is your delivery hero for today',
              title2: '555555555555555',
              urlImage:
                  'https://flower.elevateegy.com/uploads/default-profile.png',
              noIcon: false),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            height: 65,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Colors.grey.shade200,
         ),

          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildOrderTimeline('Accepted'),
          ),
          SizedBox(height: 10),
          Spacer(),
          CustomElevatedButton(
              buttonColor: ColorManager.pink,
              title: 'Show map',
              onPressed: () {}),

        ],
      ),
    ));
  }

  Widget _buildOrderTimeline(String currentState) {
    DateTime now = DateTime.now();
    List<String> statuses = [
      "Accepted",
      'Picked',
      'Out for delivery',
      "Delivered",
      "Arrived"
    ];
    if (!statuses.contains(currentState)) {
      print("Warning: Unknown order state - $currentState");
      currentState = "Accepted";
    }
    return Column(
      children: statuses.map((status) {
        int index = statuses.indexOf(status);
        bool isActive = index <= statuses.indexOf(currentState);
        DateTime currentTime = now.add(Duration(minutes: 30 * index));
        return Column(
          children: [
            _buildOrderStatus(status, _formatDateTime(currentTime),
                isActive: isActive),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildOrderStatus(String status, String date,
      {bool isActive = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isActive ? Colors.pink : Colors.white,
                border: Border.all(
                  color: isActive ? Colors.pink : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            if (status != "Arrived")
              Container(
                width: 2,
                height: 55,
                color: isActive ? Colors.pink : Colors.grey,
              ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(date, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy - HH:mm').format(dateTime);
  }
}
