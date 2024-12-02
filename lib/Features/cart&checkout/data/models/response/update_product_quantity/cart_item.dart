import 'product.dart';

class CartItem {
  Product? product;
  int? price;
  int? quantity;
  String? id;

  CartItem({this.product, this.price, this.quantity, this.id});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
