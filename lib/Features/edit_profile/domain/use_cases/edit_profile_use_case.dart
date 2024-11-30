import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/repo/edit_profile_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  EditProfileRepo editProfileRepo;
  EditProfileUseCase(this.editProfileRepo);

  Future<Result<EditProfileEntity>> editProfile(
    String token,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  ) {
    return editProfileRepo.editProfile(
      token,
      firstName,
      lastName,
      email,
      phone,
    );
  }
}
