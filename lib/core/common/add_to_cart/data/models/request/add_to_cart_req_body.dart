class AddToCartReqBody {
  String productId;
  int quantity;

  AddToCartReqBody({required this.productId, this.quantity = 1});

  Map<String, dynamic> toJson() => {
        'product': productId,
        'quantity': quantity,
      };
}
