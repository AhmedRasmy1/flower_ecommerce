import 'package:flower_ecommerce/Features/occasions/data/data_sourses/occasion_datasource.dart';
import 'package:flower_ecommerce/Features/occasions/data/models/occasion_response/occasion_response.dart';
import 'package:flower_ecommerce/Features/occasions/data/repositories/occasion_repo_imp.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart'; // Import test package
import 'occasion_repo_imp_test.mocks.dart';

@GenerateMocks([OccasionOnLineDataSource])
void main() {
  test(
    'Verify that invoking getOccasions on OccasionRepoImpl correctly triggers the getOccasions method of OccasionOnLineDataSource',
    () async {
      // Initialize the mock object properly
      final onlineDataSource = MockOccasionOnLineDataSource();
      // Create an instance of OccasionRepoImpl with the mock
      final occasionRepo = OccasionRepoImpl(onlineDataSource);
      // Result that simulates a successful response
      var result = Success<OccasionResponse?>(
          OccasionResponse()); // Adjust based on your actual Success class.

      // Stubbing the method call
      when(onlineDataSource.getOccasions()).thenAnswer((_) async => result);
      // Call the method under test
      var actual = await occasionRepo.getOccasions();
      // Verify that the getOccasions method was called once
      verify(onlineDataSource.getOccasions()).called(1);
      // Assert the result matches what you expect
      expect(actual, equals(result)); // Use 'equals' for proper equality check
    },
  );
}
