import '../../domain/entities/profile_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class ProfileDataSource {
  Future<Result<ProfileEntity?>> getProfileData(String token);
}
