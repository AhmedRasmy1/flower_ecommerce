import '../entities/profile_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class ProfileRepo {
  Future<Result<ProfileEntity?>> getProfileData(String token);
}
