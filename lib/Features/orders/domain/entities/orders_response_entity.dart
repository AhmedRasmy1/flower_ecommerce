
import 'package:flower_ecommerce/Features/orders/data/model/user_orders.dart';

class OrdersResponseEntity {
  OrdersResponseEntity({
      this.message, 
      this.orders,});


  String? message;
  UserOrders? orders;



}