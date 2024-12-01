import '../../domain/entities/profile_entity.dart';

import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_data_source.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileDataSource profileDataSource;

  ProfileRepoImpl(this.profileDataSource);

  @override
  Future<Result<ProfileEntity?>> getProfileData(String token) {
    return profileDataSource.getProfileData(token);
  }
}
