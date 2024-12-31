import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/Features/profile/domain/repository/profile_repo.dart';
import 'package:flower_ecommerce/Features/profile/domain/use_cases/profile_usecase.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_use_case.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  test(
      'when call getprofile it should call profilerepo.getprofile with correct parameters',
      () async {
    var profileRepo = MockProfileRepo();
    var profileCase = ProfileUseCase(profileRepo);

    var mockedResult = (Success<ProfileEntity?>(ProfileEntity()));
    provideDummy<Result<ProfileEntity?>>(mockedResult);
    when(profileRepo.getProfileData("token"))
        .thenAnswer((_) async => mockedResult);

    var result = await profileCase.getProfileData("token");
    expect(result, mockedResult);
    verify(profileRepo.getProfileData("token"));
  });
}
