import 'package:flower_ecommerce/Features/track%20order/skeleton_track.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flower_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/firebase_core/firebase_utils/firebase_utils.dart';
import '../../../core/firebase_core/model/order_details_add_firestore.dart';
import '../../../core/widgets/custom_card_details.dart';
import '../../track_order_location/presentation/pages/track_order_location.dart';
import '../pending_orders_page.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? orderId = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: orderId.isNotEmpty
            ? StreamBuilder<Orders?>(
                stream: FirebaseUtils.fetchLocationDriver(orderId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SkeletonTrack();
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return PendingOrdersPage();
                  }
                  Orders? orderData = snapshot.data;
                  String state = orderData?.state ?? 'Accepted';
                  Driver? driver = orderData?.driver;
                  String arrivalTime = _formatDateTime(DateTime.now());
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          arrivalTime,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Divider(height: 20, thickness: 1),
                        CustomCardDetails(
                            phone: driver?.phone ?? '',
                            subTitle: 'Is your delivery hero for today',
                            title2: '${driver?.firstName} ${driver?.lastName}',
                            urlImage: driver?.photo ?? '',
                            noIcon: false),
                        SizedBox(height: 20),
                        Center(
                            child: SvgPicture.asset('assets/images/Car.svg')),
                        SizedBox(height: 40),
                        Expanded(
                          child: _buildOrderTimeline(state),
                        ),
                        SizedBox(height: 10),
                        CustomElevatedButton(
                            buttonColor: ColorManager.pink,
                            title: 'Show map',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrackOrderLocation(
                                      orderData: orderData,
                                    ),
                                  ));
                            }),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              )
            : Scaffold(
                body: Center(
                    child: Text(
                  'The order is not yet confirmed',
                  style: getSemiBoldStyle(fontSize: 24),
                )),
              ),
      ),
    );
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
    return SingleChildScrollView(
      child: Column(
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
      ),
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
