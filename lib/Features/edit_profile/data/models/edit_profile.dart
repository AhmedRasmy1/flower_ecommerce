import '../../domain/entities/edit_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';
part 'edit_profile.g.dart';

@JsonSerializable()
class EditProfile {
  String? message;
  User? user;

  EditProfile({this.message, this.user});
  factory EditProfile.fromJson(Map<String, dynamic> json) =>
      _$EditProfileFromJson(json);
  Map<String, dynamic> toJson() => _$EditProfileToJson(this);
  EditProfileEntity toEditProfileEntity() {
    return EditProfileEntity(
      message: message,
      user: user,
    );
  }
}
