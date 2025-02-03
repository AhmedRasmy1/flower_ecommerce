import '../../../../core/common/api_result.dart';
import '../../domain/entities/edit_profile_entity.dart';

abstract class EditProfileDataSource {
  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  );
}
