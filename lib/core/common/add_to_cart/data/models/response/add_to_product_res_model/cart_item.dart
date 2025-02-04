// class CartItem {
//   String? productId;
//   num? price;
//   int? quantity;
//   String? id;
//
//   CartItem({this.productId, this.price, this.quantity, this.id});
//
//   factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
//         productId: json['product'] as String?,
//         price: json['price'] as num?,
//         quantity: json['quantity'] as int?,
//         id: json['_id'] as String?,
//       );
//
//   Map<String, dynamic> toJson() => {
//         'product': productId,
//         'price': price,
//         'quantity': quantity,
//         '_id': id,
//       };
// }
//
import '../../../../../../../Features/cart&checkout/data/models/response/fetch_user_cart_response/product.dart';

class CartItem {
  CartItem({
    this.product,
    this.price,
    this.quantity,
    this.id,});

  CartItem.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  Product? product;
  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }

}

