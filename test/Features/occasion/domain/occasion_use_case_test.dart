import 'package:flower_ecommerce/Features/occasions/data/models/occasion_response/occasion_response.dart';
import 'package:flower_ecommerce/Features/occasions/domain/repositories/occasion_repo.dart';
import 'package:flower_ecommerce/Features/occasions/domain/use_cases/occasion_use_case.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_use_case_test.mocks.dart';

@GenerateMocks([OccasionRepo])
void main() {
  test(
      'when call getoccasions it should call occasionrepo.getoccasions with correct parameters',
      () async {
    var occasionRepo = MockOccasionRepo();
    var occasionCase = OccasionUseCase(occasionRepo);

    var mockedResult = (Success<OccasionResponse?>(OccasionResponse()));
    provideDummy<Result<OccasionResponse?>>(mockedResult);
    when(occasionRepo.getOccasions()).thenAnswer((_) async => mockedResult);

    var result = await occasionCase.getOccasions();
    expect(result, mockedResult);
    verify(occasionRepo.getOccasions());
  });
}
