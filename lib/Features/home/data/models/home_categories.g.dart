// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategories _$HomeCategoriesFromJson(Map<String, dynamic> json) =>
    HomeCategories(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$HomeCategoriesToJson(HomeCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
