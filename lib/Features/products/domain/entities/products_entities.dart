class AllProductsEntities {
  AllProductsEntities({
    this.message,
    this.products,
  });

  String? message;
  List<ProductsEntities>? products;
}

class ProductsEntities {
  ProductsEntities({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
  });

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
}
