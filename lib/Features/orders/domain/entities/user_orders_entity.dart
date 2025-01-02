
import 'package:flower_ecommerce/Features/orders/data/model/user_order_items.dart';

class UserOrdersEntity {
  UserOrdersEntity({
      this.id, 
      this.user, 
      this.orderItems, 
      this.totalPrice, 
      this.paymentType, 
      this.isPaid, 
      this.isDelivered, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? id;
  String? user;
  List<UserOrderItems>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? createdAt;
  String? updatedAt;
  num? v;



}