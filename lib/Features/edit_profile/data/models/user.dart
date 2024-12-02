import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  List<dynamic>? wishlist;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  DateTime? createdAt;
  String? passwordResetCode;
  DateTime? passwordResetExpires;
  bool? resetCodeVerified;
  List<dynamic>? addresses;

  User({
    this.wishlist,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.addresses,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
