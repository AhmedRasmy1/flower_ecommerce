import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/firebase_core/firebase_utils/firebase_utils.dart';
import '../../../core/firebase_core/model/order_details_add_firestore.dart';
import '../../track_order_location/presentation/pages/track_order_location.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? orderId = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Track order', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: orderId.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<Orders?>(
          stream: FirebaseUtils.fetchLocationDriver(orderId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.pink,
                  ));
            }
            if (!snapshot.hasData ||
                snapshot.data == null ) {
              return Center(child: Text("No order found"));
            }
            Orders? orderData =snapshot.data;
            // snapshot.data!.data() as Map<String, dynamic>;
            String state = orderData?.state??'Accepted';
                // orderData['state'] ?? 'Accepted';
            Driver? driver = orderData?.driver;
            String arrivalTime = _formatDateTime(DateTime.now());
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.person, color: Colors.pink),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${driver?.firstName} ${driver?.lastName}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Is your delivery hero for today',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.phone, color: Colors.pink),
                      SizedBox(width: 16),
                      Icon(Icons.chat, color: Colors.pink),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: SvgPicture.asset('assets/images/Car.svg')
                  ),
                  SizedBox(height: 40),
                  Expanded(
                    child: _buildOrderTimeline(state),
                  ),
                  SizedBox(height: 10),
                  CustomElevatedButton(
                      buttonColor: ColorManager.pink,
                      title: 'Show map',
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrackOrderLocation(orderData: orderData,),
                            ));
                      }),
                  SizedBox(height: 40),

                ],
              ),
            );
          },
        ),
      )
          : Scaffold(
        body: Center(
            child: Text(
              'The order is not yet confirmed',
              style: getSemiBoldStyle(fontSize: 24),
            )),
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
