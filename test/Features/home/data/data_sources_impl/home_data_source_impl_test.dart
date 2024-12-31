import 'package:flower_ecommerce/Features/home/data/data_sources_impl/home_data_source_impl.dart';
import 'package:flower_ecommerce/Features/home/data/models/home_model.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  test(
      'Verify that invoking getHomeData on HomeDataSource correctly calls the getHomeData method of ApiService to fetch and display the items',
      () async {
    // Arrange
    var apiService = MockApiService();
    var homeDataSourceImpl = HomeDataSourceImpl(apiService);

    when(apiService.getHomeData())
        .thenAnswer((_) async => HomeModel.fromJson({}));
    // Act
    var result = await homeDataSourceImpl.getHomeData();
    // Assert
    verify(apiService.getHomeData());
    expect(result, isA<Success<HomeEntity>>());
  });
}
