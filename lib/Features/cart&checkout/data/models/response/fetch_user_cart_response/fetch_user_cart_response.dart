import 'cart.dart';

class FetchUserCartResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  FetchUserCartResponse({this.message, this.numOfCartItems, this.cart});

  factory FetchUserCartResponse.fromJson(Map<String, dynamic> json) {
    return FetchUserCartResponse(
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
