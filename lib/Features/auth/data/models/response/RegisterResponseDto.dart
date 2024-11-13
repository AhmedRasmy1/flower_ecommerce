import '../../../domain/entities/register_entities.dart';

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.error, 
      this.user, 
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? error;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  RegisterEntities toRegisterEntities(){
    return RegisterEntities(
        error: error,
        message: message,
        token: token,
        user: user?.toEntity()
    );
  }

}

class User {
  User({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.id, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['role'] = role;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      Id: id,
      createdAt: createdAt,
    );
  }
}