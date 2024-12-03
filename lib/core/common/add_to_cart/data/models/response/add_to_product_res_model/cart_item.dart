class CartItem {
  String? productId;
  num? price;
  int? quantity;
  String? id;

  CartItem({this.productId, this.price, this.quantity, this.id});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json['product'] as String?,
        price: json['price'] as num?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': productId,
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
