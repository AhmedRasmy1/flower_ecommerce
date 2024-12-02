// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      wishlist: json['wishlist'] as List<dynamic>?,
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      passwordResetCode: json['passwordResetCode'] as String?,
      passwordResetExpires: json['passwordResetExpires'] == null
          ? null
          : DateTime.parse(json['passwordResetExpires'] as String),
      resetCodeVerified: json['resetCodeVerified'] as bool?,
      addresses: json['addresses'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'wishlist': instance.wishlist,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'createdAt': instance.createdAt?.toIso8601String(),
      'passwordResetCode': instance.passwordResetCode,
      'passwordResetExpires': instance.passwordResetExpires?.toIso8601String(),
      'resetCodeVerified': instance.resetCodeVerified,
      'addresses': instance.addresses,
    };
