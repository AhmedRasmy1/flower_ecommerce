class CartItemEntity {
  final String? id, title, description, imgCover;
  final double? price, totalPrice;
  final int? quantity;

  CartItemEntity({
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.price,
    this.totalPrice,
    this.quantity,
  });
}
