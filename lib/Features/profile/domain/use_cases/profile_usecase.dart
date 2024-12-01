import '../entities/profile_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repository/profile_repo.dart';

@injectable
class ProfileUseCase {
  ProfileRepo profileRepo;

  ProfileUseCase(this.profileRepo);

  Future<Result<ProfileEntity?>> getProfileData(String token) {
    return profileRepo.getProfileData(token);
  }
}
