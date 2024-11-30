/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';

import '../../../auth/data/models/response/register_response_dto.dart';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
    ProfileResponse({
         this.message,
         this.user,
        this.error
    });

    String? message;
    User? user;
    String? error;
    factory ProfileResponse.fromJson(Map<dynamic, dynamic> json) => ProfileResponse(
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
        return ProfileEntity(
            message: message,
            user: user,
            error: error
        );
    }



}



