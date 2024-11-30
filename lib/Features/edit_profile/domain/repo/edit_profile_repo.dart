import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class EditProfileRepo {
  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  );
}
