import 'package:json_annotation/json_annotation.dart';
part 'occasion.g.dart';

@JsonSerializable()
class Occasion {
  String? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Occasion({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Occasion.fromJson(Map<String, dynamic> json) =>
      _$OccasionFromJson(json);
  Map<String, dynamic> toJson() => _$OccasionToJson(this);
}
