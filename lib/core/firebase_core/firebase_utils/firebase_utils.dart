import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/order_details_add_firestore.dart';

class FirebaseUtils {
  static CollectionReference<Orders> _getDriverCollection() {
    return FirebaseFirestore.instance
        .collection('OrdersInfo')
        .withConverter<Orders>(
          fromFirestore: (snapshot, options) =>
              Orders.fromJson(snapshot.data()!),
          toFirestore: (orderInfo, options) => orderInfo.toJson(),
        );
  }

  static Stream<Orders>? fetchLocationDriver(String idOrder) {
    try {
      var ordersCollection = _getDriverCollection();

      var orderDoc = ordersCollection.doc(idOrder).withConverter<Orders>(
        fromFirestore: (snapshot, options) {
          var data = snapshot.data();
          if (data == null) {
            throw Exception("No data found for order ID: $idOrder");
          }
          return Orders.fromJson(data);
        },
        toFirestore: (order, options) => order.toJson(),
      );

      return orderDoc.snapshots().asyncMap((orderSnapshot) async {
        if (!orderSnapshot.exists) {
          throw Exception("Order does not exist for ID: $idOrder");
        }

        var order = orderSnapshot.data()!;
        var orderItemsCollection = ordersCollection
            .doc(idOrder)
            .collection('Products')
            .withConverter<OrderItems>(
          fromFirestore: (snapshot, options) =>
              OrderItems.fromJson(snapshot.data()!),
          toFirestore: (orderItem, options) => orderItem.toJson(),
        );

        var orderItemsSnapshot = await orderItemsCollection.get();
        var orderItems = orderItemsSnapshot.docs.map((doc) => doc.data()).toList();

        order.orderItems = orderItems;

        return order;
      });
    } catch (e) {
      log('Error in fetchLocationDriver: $e');
      return null;
    }
  }

}


