import 'cart_item.dart';

class Cart {
  String? id;
  String? user;
  List<CartItem>? cartItems;
  int? totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        cartItems: (json['cartItems'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'cartItems': cartItems?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
