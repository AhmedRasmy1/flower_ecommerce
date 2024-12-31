import 'package:flower_ecommerce/Features/products_details/data/data_sources/product_details_online_datasource.dart';
import 'package:flower_ecommerce/Features/products_details/data/repositories/product_details_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

import 'product_details_repo_impl_test.mocks.dart';

@GenerateMocks([ProductDetailsOnlineDataSource])
void main() {
  test(
    'Verify that invoking getProductDetails'
    ' on ProductRepoImpl correctly triggers'
    ' the getProducts method of '
    'ProductDetailsOnLineDataSource',
    () async {
      String productId = '12345';
      final onlineDataSource = MockProductDetailsOnlineDataSource();
      final productRepo = ProductDetailsRepoImpl(onlineDataSource);
      var result = Success<ProductDetailsEntity>(
          ProductDetailsEntity()); // Adjust based on your actual Success class.

      when(onlineDataSource.getProductDetails(productId))
          .thenAnswer((_) async => result);
      var actual = await productRepo.getProductDetails(productId);
      verify(onlineDataSource.getProductDetails(productId)).called(1);
      expect(actual, equals(result)); // Use 'equals' for proper equality check
    },
  );
}
