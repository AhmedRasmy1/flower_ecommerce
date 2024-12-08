import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/Features/products_details/domain/repositories/product_details_repo.dart';
import 'package:flower_ecommerce/Features/products_details/domain/use_cases/product_details_usecases.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

import 'product_details_usecases_test.mocks.dart';

@GenerateMocks([ProductDetailsRepo])
void main() {
  late MockProductDetailsRepo mockRepo;
  late ProductDetailsUseCases useCases;

  setUp(() {
    mockRepo = MockProductDetailsRepo();
    useCases = ProductDetailsUseCases(mockRepo);
  });

  group('getProductDetails', () {
    const productId = '12345';

    test('should return Success when repository call is successful', () async {
      // Arrange
      final entity = ProductDetailsEntity(id: productId, title: 'Product A');
      when(mockRepo.getProductDetails(productId))
          .thenAnswer((_) async => Success(entity));

      // Act
      final result = await useCases.getProductDetails(productId);

      // Assert
      expect(result, isA<Success<ProductDetailsEntity>>());
      final successResult = result as Success<ProductDetailsEntity>;
      expect(successResult.data.id, productId);
      expect(successResult.data.title, 'Product A');
      verify(mockRepo.getProductDetails(productId)).called(1);
    });

    test('should return Fail when repository call fails', () async {
      // Arrange
      final exception = Exception('Failed to fetch product details');
      when(mockRepo.getProductDetails(productId))
          .thenAnswer((_) async => Fail(exception));

      // Act
      final result = await useCases.getProductDetails(productId);

      // Assert
      expect(result, isA<Fail<ProductDetailsEntity>>());
      final failResult = result as Fail<ProductDetailsEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception.toString(),
          contains('Failed to fetch product details'));
      verify(mockRepo.getProductDetails(productId)).called(1);
    });
  });
}
