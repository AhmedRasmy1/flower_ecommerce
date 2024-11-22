class ProductDetailsEntity {
  ProductDetailsEntity({
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.quantity,
  });

  String? id;
  String? title;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? quantity;


}
