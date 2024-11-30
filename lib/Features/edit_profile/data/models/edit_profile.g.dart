// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfile _$EditProfileFromJson(Map<String, dynamic> json) => EditProfile(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileToJson(EditProfile instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
