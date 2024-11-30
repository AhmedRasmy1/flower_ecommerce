import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class ProfileRepo {
  Future<Result<ProfileEntity?>> getProfileData(String token);
}
