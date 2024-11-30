import 'package:flower_ecommerce/Features/edit_profile/data/data_source/edit_profile_data_source.dart';
import 'package:flower_ecommerce/Features/edit_profile/data/models/user.dart';
import 'package:flower_ecommerce/Features/edit_profile/data/repo_impl/edit_profile_repo_impl.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_repo_impl_test.mocks.dart';

@GenerateMocks([EditProfileDataSource])
void main() {
  test(
      'Tests that when the editProfile method of EditProfileRepo is called it should invoke the ditProfile function of the EditProfileDataSource',
      () async {
    //! Arrange
    var editprofileDataSource = MockEditProfileDataSource();
    var editProfilerepoImpl = EditProfileRepoImpl(editprofileDataSource);

    var token = 'fakeToken';
    var firstName = 'Mido';
    var lastName = 'Ahmed';
    var email = 'fakeEmail';
    var phone = 'fakePhone';

    var mockedResult = Success<EditProfileEntity>(
      EditProfileEntity(
        message: "Fake message",
        user: User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
        ),
      ),
    );
    when(editprofileDataSource.editProfile(
            token, firstName, lastName, email, phone))
        .thenAnswer((_) async => mockedResult);
    //! Act
    var result = await editProfilerepoImpl.editProfile(
        token, firstName, lastName, email, phone);
    //! Assert
    verify(editprofileDataSource.editProfile(
        token, firstName, lastName, email, phone));
    expect(result, mockedResult);
  });
}
