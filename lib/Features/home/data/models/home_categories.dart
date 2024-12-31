import 'package:json_annotation/json_annotation.dart';
part 'home_categories.g.dart';

@JsonSerializable()
class HomeCategories {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  HomeCategories({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });
  factory HomeCategories.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$HomeCategoriesToJson(this);
}
