import 'package:flower_ecommerce/Features/edit_profile/data/data_source_impl/edit_profile_data_source_impl.dart';
import 'package:flower_ecommerce/Features/edit_profile/data/models/edit_profile.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  test(
      'Verify that invoking editProfile on EditProfileDataSource correctly calls the editPriofile method of ApiService to edit the profile',
      () async {
    // Arrange
    var apiService = MockApiService();
    var editProfileDataSourceImpl = EditProfileDataSourceImpl(apiService);

    var token = 'fakeToken';
    var firstName = 'Mido';
    var lastName = 'Ahmed';
    var email = 'fakeEmail';
    var phone = 'fakePhone';
    when(apiService.editProfile(token, firstName, lastName, email, phone))
        .thenAnswer((_) async => EditProfile.fromJson({}));
    // Act
    var result = await editProfileDataSourceImpl.editProfile(
        token, firstName, lastName, email, phone);

    // Assert
    verify(apiService.editProfile(token, firstName, lastName, email, phone));
    expect(result, isA<Success<EditProfileEntity>>());
  });
  test('Verify that editProfile returns failure when ApiService returns error',
      () async {
    // Arrange
    var apiService = MockApiService();
    var editProfileDataSourceImpl = EditProfileDataSourceImpl(apiService);
    var token = 'fakeToken';
    var firstName = 'Mido';
    var lastName = 'Ahmed';
    var email = 'fakeEmail';
    var phone = 'fakePhone';
    when(apiService.editProfile(token, firstName, lastName, email, phone))
        .thenAnswer((_) async => throw Exception('Error'));
    // Act
    var result = await editProfileDataSourceImpl.editProfile(
        token, firstName, lastName, email, phone);
    // Assert
    expect(result, isA<Fail<EditProfileEntity>>());
  });
}
