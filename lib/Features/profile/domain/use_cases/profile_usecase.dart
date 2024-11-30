import 'package:flower_ecommerce/Features/profile/data/model/profile_response.dart';
import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../../occasions/data/models/occasion_response/occasion_response.dart';
import '../repository/profile_repo.dart';

@injectable
class ProfileUseCase {
  ProfileRepo profileRepo;

  ProfileUseCase(this.profileRepo);

  Future<Result<ProfileEntity?>>getProfileData(String token) {
    return profileRepo.getProfileData(token);
  }
}

