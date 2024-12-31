import '../../domain/entities/products_entities.dart';

class AllProducts {
  AllProducts({
    this.message,
    this.products,
  });

  AllProducts.fromJson(dynamic json) {
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? message;
  List<Products>? products;

  AllProductsEntities toAllProductsEntities() {
    return AllProductsEntities(
        message: message,
        products: products?.map((products) => products.toProduct()).toList());
  }
}

class Products {
  Products({
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id2,
  });

  Products.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id2 = json['id'];
  }
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
  String? createdAt;
  String? updatedAt;
  num? v;
  String? id2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id2;
    return map;
  }

  ProductsEntities toProduct() {
    return ProductsEntities(
        id: id,
        category: category,
        description: description,
        images: images,
        imgCover: imgCover,
        occasion: occasion,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        slug: slug,
        title: title);
  }
}
