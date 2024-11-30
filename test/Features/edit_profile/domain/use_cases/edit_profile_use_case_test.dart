import 'package:flutter_test/flutter_test.dart';

import 'package:flower_ecommerce/Features/edit_profile/data/models/user.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/repo/edit_profile_repo.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_use_case_test.mocks.dart';

@GenerateMocks([EditProfileRepo])
void main() {
  test(
      'when I call editProfile method in use case, it should call the appropriate repository method',
      () async {
    // Arrange
    var editProfileRepo = MockEditProfileRepo();
    var editProfileUseCase = EditProfileUseCase(editProfileRepo);
    var firstName = 'Mido';
    var lastName = 'Ahmed';
    var email = 'fakeEmail';
    var phone = 'fakePhone';
    var token = 'fakeToken';

    var mockedResult = Success<EditProfileEntity>(
      EditProfileEntity(
        message: 'Fake message',
        user: User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
        ),
      ),
    );
    when(editProfileRepo.editProfile(token, firstName, lastName, email, phone))
        .thenAnswer((_) async => mockedResult);
    // Act
    var result = await editProfileUseCase.editProfile(
      token,
      firstName,
      lastName,
      email,
      phone,
    );
    // Assert
    verify(
        editProfileRepo.editProfile(token, firstName, lastName, email, phone));
    expect(result, mockedResult);
    // Here you would verify that the expected outcomes occurred.
  });
}
