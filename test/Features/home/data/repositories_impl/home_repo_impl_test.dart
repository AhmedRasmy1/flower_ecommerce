import 'package:flower_ecommerce/Features/home/data/data_sources/home_data_source.dart';
import 'package:flower_ecommerce/Features/home/data/repositories_impl/home_repo_impl.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  test(
      'Verify that invoking getHomeData on HomeRepoImpl correctly triggers the getHomeData method of HomeDataSource to retrieve and display the items.',
      () async {
    //Arrange
    var homeDataSource = MockHomeDataSource();
    var homeRepoImpl = HomeRepoImpl(homeDataSource);
    var mockedResult = Success<HomeEntity>(HomeEntity(
        message: 'Fake message',
        bestSeller: [],
        occasions: [],
        products: [],
        categories: []));
    when(homeDataSource.getHomeData()).thenAnswer((_) async => mockedResult);
    //Act
    var result = await homeRepoImpl.getHomeData();
    //Assert
    verify(homeDataSource.getHomeData());
    expect(result, mockedResult);
  });
}
