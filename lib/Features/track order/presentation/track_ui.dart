import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  TrackOrderScreen({required this.orderId});
  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('OrdersInfo').doc(orderId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
            return Center(child: Text("No order found"));
          }
          var orderData = snapshot.data!.data() as Map<String, dynamic>;
          // Accessing data
          String state = orderData['state'] ?? 'Accepted';
          Map<String, dynamic> driver = orderData['driver'] ?? {};
          String arrivalTime = _formatDateTime(DateTime.now());
          return Padding(
            padding: const EdgeInsets.all(16.0),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                          driver['firstName'] ?? 'Unknown',
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
                  child: Image.asset('assets/images/Car.png', errorBuilder: (context, error, stackTrace) {
                    return Text('Image not found');
                  }),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: _buildOrderTimeline(state),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Show map', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
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
            _buildOrderStatus(status, _formatDateTime(currentTime), isActive: isActive),
            SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
  Widget _buildOrderStatus(String status, String date, {bool isActive = false}) {
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
                  color: Colors.pink,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            if (status != "Arrived")
              Container(
                width: 2,
                height: 40,
                color: Colors.pink,
              ),
          ],
        ),
        SizedBox(width: 10),
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