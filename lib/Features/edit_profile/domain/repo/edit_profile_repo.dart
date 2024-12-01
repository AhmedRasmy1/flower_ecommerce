import '../entities/edit_profile_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class EditProfileRepo {
  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  );
}
