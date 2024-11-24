// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionResponse _$OccasionResponseFromJson(Map<String, dynamic> json) =>
    OccasionResponse(
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => Occasion.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OccasionResponseToJson(OccasionResponse instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'occasions': instance.occasions,
      'message': instance.message,
    };
