import 'dart:convert';

import '../../domain/entities/profile_entity.dart';

import '../../../auth/data/models/response/register_response_dto.dart';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({this.message, this.user, this.error});

  String? message;
  User? user;
  String? error;
  factory ProfileResponse.fromJson(Map<dynamic, dynamic> json) =>
      ProfileResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
        error: json["error"],
      );

  Map<dynamic, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "error": error,
      };
  ProfileEntity toProfileEntity() {
    return ProfileEntity(message: message, user: user, error: error);
  }
}
