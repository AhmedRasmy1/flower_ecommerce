
import '../../data/model/user_orders.dart';

class UserOrdersResponseEntity {
  UserOrdersResponseEntity({
      this.message, 
      this.orders,});


  String? message;
  List<UserOrders>? orders;



}