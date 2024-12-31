import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/Features/home/domain/repositories/home_repo.dart';
import 'package:flower_ecommerce/Features/home/domain/use_cases/home_use_case.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  test(
      'Ensure that invoking getHomeData on HomeUseCase triggers the getHomeData method of HomeRepo to fetch and display the items.',
      () async {
    //Arrange
    var homeRepo = MockHomeRepo();
    var homeUseCase = HomeUseCase(homeRepo);
    var mockedResult = Success<HomeEntity>(HomeEntity(
        message: 'Fake message',
        bestSeller: [],
        occasions: [],
        products: [],
        categories: []));
    when(homeRepo.getHomeData()).thenAnswer((_) async => mockedResult);
    //Act
    var result = await homeUseCase.getHomeData();
    //Assert
    verify(homeRepo.getHomeData());
    expect(result, mockedResult);
  });
}
