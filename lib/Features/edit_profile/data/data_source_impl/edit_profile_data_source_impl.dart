import 'package:flower_ecommerce/Features/edit_profile/data/data_source/edit_profile_data_source.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/core/api/api_extentions.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImpl implements EditProfileDataSource {
  ApiService apiService;
  EditProfileDataSourceImpl(this.apiService);
  @override
  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  ) {
    return executeApi(() async {
      var response = await apiService.editProfile(
          token, firstName, lastName, email, phone);
      var data = response.toEditProfileEntity();
      return data;
    });
  }
}
