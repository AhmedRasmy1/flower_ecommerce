import '../../../../domain/entities/forget_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  ForgetPasswordResponse({this.message, this.info, this.error});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  String? message;
  String? info;
  String? error;

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);

  ForgetPasswordEntity toForgetPasswordEntity() {
    return ForgetPasswordEntity(message: message, info: info, error: error);
  }
}
