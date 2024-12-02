import '../../domain/entities/best_seller_entity.dart';

/// _id : "6737c7b1d485ca1c2879ce7f"
/// title : "Wfoan aasdqqsss"
/// slug : "wfoan-aasdqqsss"
/// description : "Material\\tPolyester Blend\\nColour Name\\tMulticolour\\nDepartment\\tWomen"
/// imgCover : "https://flower.elevateegy.com/uploads/9a159b67-4462-4505-9563-e166e952d27d-eniac-the-second-electronic-calculator-los-alamos-national-laboratory.jpg"
/// images : ["https://flower.elevateegy.com/uploads/75675f76-e2a1-4be1-a936-463899bd99b6-FB_IMG_1728121438182.jpg"]
/// price : 440
/// priceAfterDiscount : 100
/// quantity : 220
/// category : "6407e96c5bbc6e43516931d7"
/// occasion : "6407e96c5bbc6e43516931d7"
/// createdAt : "2024-11-15T22:14:09.244Z"
/// updatedAt : "2024-11-19T12:07:21.249Z"
/// __v : 0
/// id : "6737c7b1d485ca1c2879ce7f"

class BestSeller {
  BestSeller({
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

  BestSeller.fromJson(dynamic json) {
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
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;

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

  BestSellerEntity toBestSellerEntity() {
    return BestSellerEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}
