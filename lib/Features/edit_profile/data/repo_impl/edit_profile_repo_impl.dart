import '../data_source/edit_profile_data_source.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../../domain/repo/edit_profile_repo.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  EditProfileDataSource editProfileDataSource;
  EditProfileRepoImpl(this.editProfileDataSource);
  @override
  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  ) {
    return editProfileDataSource.editProfile(
      token,
      firstName,
      lastName,
      email,
      phone,
    );
  }
}
