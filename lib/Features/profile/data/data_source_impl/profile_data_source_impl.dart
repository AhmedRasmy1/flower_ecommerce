import '../../domain/entities/profile_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../data_source/profile_data_source.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  final ApiService _authRetrofit;

  ProfileDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<ProfileEntity?>> getProfileData(String token) {
    return executeApi(() async {
      var response = await _authRetrofit.getProfileData(token);
      return response?.toProfileEntity();
    });
  }
}
