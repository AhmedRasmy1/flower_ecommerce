import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce/Features/products_details/data/data_source_imp/product_details_online_datasource_impl.dart';
import 'package:flower_ecommerce/Features/products_details/data/models/response/product_details_dto.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

import '../../../auth/data/data_source_impl/login_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late ProductDetailsOnlineDataSourceImp dataSource;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = ProductDetailsOnlineDataSourceImp(mockApiService);
  });

  group('getProductDetails', () {
    const productId = '12345';

    test('should return Success when the API call is successful', () async {
      // Arrange
      final productDto = ProductDetailsDto(
        product: Product(
            id: productId, title: 'Product A', description: 'Description A'),
      );

      when(mockApiService.getProductDetails(productId))
          .thenAnswer((_) async => productDto);

      // Act
      final result = await dataSource.getProductDetails(productId);

      // Assert
      expect(result, isA<Success<ProductDetailsEntity>>());
      final successResult = result as Success<ProductDetailsEntity>;
      expect(successResult.data.id, productId);
      expect(successResult.data.title, 'Product A');
    });

    test('should return Fail when the API call returns null product', () async {
      // Arrange
      final productDto =
          ProductDetailsDto(product: null, message: 'Product not found');

      when(mockApiService.getProductDetails(productId))
          .thenAnswer((_) async => productDto);

      // Act
      final result = await dataSource.getProductDetails(productId);

      // Assert
      expect(result, isA<Fail<ProductDetailsEntity>>());
      final failResult = result as Fail<ProductDetailsEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception.toString(),
          contains('Failed to fetch product details'));
    });

    test('should throw Exception when API call fails', () async {
      // Arrange
      when(mockApiService.getProductDetails(productId))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await dataSource.getProductDetails(productId);

      // Assert
      expect(result, isA<Fail<ProductDetailsEntity>>());
      final failResult = result as Fail<ProductDetailsEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception.toString(), contains('Network error'));
    });
  });
}
