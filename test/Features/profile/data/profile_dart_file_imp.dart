import 'package:flower_ecommerce/Features/profile/data/data_source/profile_data_source.dart';
import 'package:flower_ecommerce/Features/profile/data/repositories/profile_repo_imp.dart';
import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_dart_file_imp.mocks.dart';

@GenerateMocks([ProfileDataSource])
void main() {
  test(
    'Verify that invoking getOccasions on OccasionRepoImpl correctly triggers the getOccasions method of OccasionOnLineDataSource',
    () async {
      // Initialize the mock object properly
      final onlineDataSource = MockProfileDataSource();
      // Create an instance of OccasionRepoImpl with the mock
      final profileRepo = ProfileRepoImpl(onlineDataSource);
      // Result that simulates a successful response
      var result = Success<ProfileEntity?>(
          ProfileEntity()); // Adjust based on your actual Success class.

      // Stubbing the method call
      when(onlineDataSource.getProfileData("token"))
          .thenAnswer((_) async => result);
      // Call the method under test
      var actual = await profileRepo.getProfileData("token");

      verify(onlineDataSource.getProfileData("token")).called(1);
      // Assert the result matches what you expect
      expect(actual, equals(result)); // Use 'equals' for proper equality check
    },
  );
}
