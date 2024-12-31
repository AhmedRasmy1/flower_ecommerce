import '../../../auth/data/models/response/register_response_dto.dart';

class ProfileEntity {
  ProfileEntity({this.message, this.user, this.error});

  String? message;
  User? user;
  String? error;
}
