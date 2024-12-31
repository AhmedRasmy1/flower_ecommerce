import 'package:flower_ecommerce/Features/best_seller/data/data_source/best_online_data_source_impl.dart';
import 'package:flower_ecommerce/Features/best_seller/data/model/best_seller_response.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../home/data/data_sources_impl/home_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  test(
      'when call BestOnlineDataSource for get best seller it should call it from ApiService',
      () async {
    var mockApiService = MockApiService();
    var bestOnLineDataSource = BestOnLineDataSourceImpl(mockApiService);

    var mockBestSellerResponse = BestSellerResponse();

    when(mockApiService.getBestSeller())
        .thenAnswer((_) async => mockBestSellerResponse);

    // Act
    var result = await bestOnLineDataSource.getBestSeller();

    // Assert
    verify(mockApiService.getBestSeller());
    expect(result, isA<Success<List<BestSellerEntity>?>>());
  });
}
