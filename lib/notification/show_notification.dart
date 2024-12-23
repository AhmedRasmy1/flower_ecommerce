import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';

Future<void> showLocalNotification() async {
  const AndroidNotificationDetails androidDetails =
  AndroidNotificationDetails('channelId', 'channelName',
      importance: Importance.high, priority: Priority.high);

  const NotificationDetails notificationDetails =
  NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
      0, 'Title', 'Body', notificationDetails);
}