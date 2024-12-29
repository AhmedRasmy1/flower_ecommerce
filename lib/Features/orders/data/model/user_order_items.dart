

import '../../domain/entities/user_order_items_entity.dart';

class UserOrderItems {
  UserOrderItems({
      this.product, 
      this.price, 
      this.quantity, 
      this.id,});

  UserOrderItems.fromJson(dynamic json) {
    product = json['product'];
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  String? product;
  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = product;
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }

 UserOrderItemsEntity toUserOrderItemsEntity() {
    return UserOrderItemsEntity(
   product: product,
      price: price,
      quantity: quantity,
      id: id,
    );
  }

}