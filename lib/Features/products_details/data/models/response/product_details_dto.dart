import '../../../domain/entities/product_details_entity.dart';

class ProductDetailsDto {
  ProductDetailsDto({
    this.message,
    this.product,
  });

  ProductDetailsDto.fromJson(dynamic json) {
    message = json['message'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  String? message;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }
}

class Product {
  Product({
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
  });

  Product.fromJson(dynamic json) {
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
  }

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  int? v;

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
    return map;
  }

  ProductDetailsEntity toProductDetailsEntity() {
    return ProductDetailsEntity(
      description: description,
      id: id,
      images: images,
      imgCover: imgCover,
      price: price,
      quantity: quantity,
      title: title,
      priceAfterDiscount: priceAfterDiscount,
    );
  }
}

class AuthMappers {
  static ProductDetailsEntity toProductDetailsEntity(
      ProductDetailsDto response) {
    if (response.product == null) {
      return ProductDetailsEntity(
        description: "",
        id: "",
        images: [],
        imgCover: "",
        price: 0,
        quantity: 0,
        title: "",
      );
    }
    return ProductDetailsEntity(
      description: response.product!.description,
      id: response.product!.id,
      images: response.product!.images,
      imgCover: response.product!.imgCover,
      price: response.product!.price,
      quantity: response.product!.quantity,
      title: response.product!.title,
    );
  }
}
