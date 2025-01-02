
import 'package:flower_ecommerce/Features/orders/data/model/user_orders.dart';

import '../../domain/entities/orders_response_entity.dart';

class OrdersResponse {
  OrdersResponse({
      this.message, 
      this.orders,});

  OrdersResponse.fromJson(dynamic json) {
    message = json['message'];
    orders = json['orders'] != null ? UserOrders.fromJson(json['orders']) : null;
  }
  String? message;
  UserOrders? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (orders != null) {
      map['orders'] = orders?.toJson();
    }
    return map;
  }

  OrdersResponseEntity toOrdersResponseEntity() {
    return OrdersResponseEntity(
     message: message,
      orders: orders
    );
  }

}