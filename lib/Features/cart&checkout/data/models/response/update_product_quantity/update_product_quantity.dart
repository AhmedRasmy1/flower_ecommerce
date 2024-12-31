import 'cart.dart';

class UpdateProductQuantityResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  UpdateProductQuantityResponse({this.message, this.numOfCartItems, this.cart});

  factory UpdateProductQuantityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProductQuantityResponse(
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
