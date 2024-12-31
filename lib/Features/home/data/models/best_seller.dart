import 'package:json_annotation/json_annotation.dart';

part 'best_seller.g.dart';

@JsonSerializable()
class BestSeller {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<dynamic>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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

  factory BestSeller.fromJson(Map<String, dynamic> json) =>
      _$BestSellerFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerToJson(this);
}
