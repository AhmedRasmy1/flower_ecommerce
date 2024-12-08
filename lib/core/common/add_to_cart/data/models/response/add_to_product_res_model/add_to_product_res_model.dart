import 'cart.dart';

class AddToCartResModel {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  AddToCartResModel({this.message, this.numOfCartItems, this.cart});

  factory AddToCartResModel.fromJson(Map<String, dynamic> json) {
    return AddToCartResModel(
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'numOfCartItems': numOfCartItems,
        'cart': cart?.toJson(),
      };
}
