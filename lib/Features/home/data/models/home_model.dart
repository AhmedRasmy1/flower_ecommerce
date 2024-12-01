import 'home_categories.dart';

import '../../domain/entities/home_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'best_seller.dart';
import 'occasion.dart';
import 'product.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  String? message;
  List<Product>? products;
  List<BestSeller>? bestSeller;
  List<Occasion>? occasions;
  List<HomeCategories>? categories;

  HomeModel({this.message, this.products, this.bestSeller, this.occasions});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
  HomeEntity toHomeEntity() {
    return HomeEntity(
      message: message,
      products: products,
      bestSeller: bestSeller,
      occasions: occasions,
      categories: categories,
    );
  }
}
