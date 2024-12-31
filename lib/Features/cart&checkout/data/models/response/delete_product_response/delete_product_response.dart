import 'cart.dart';

class DeleteProductResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  DeleteProductResponse({this.message, this.numOfCartItems, this.cart});

  factory DeleteProductResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProductResponse(
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
