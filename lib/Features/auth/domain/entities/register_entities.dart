

class RegisterEntities {
  final String? message;
  final String? error;
  final UserEntity? user;
  final String? token;
  RegisterEntities ({
    this.message,
    this.error,
    this.user,
    this.token,
  });


}


class UserEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? Id;
  final String? createdAt;
  UserEntity ({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.Id,
    this.createdAt,
  });


}


