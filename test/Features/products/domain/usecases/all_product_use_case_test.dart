import 'package:flower_ecommerce/Features/products/domain/entities/products_entities.dart';
import 'package:flower_ecommerce/Features/products/domain/repositories/products_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'all_product_use_case_test.mocks.dart';


@GenerateMocks([ProductsRepo])
void main() {
  test('when call getproducts it calls getproduct of product Repo', () async {
    var productRepo = MockProductsRepo();

    var mockedResult = (Success<AllProductsEntities?>(AllProductsEntities()));
    provideDummy<Result<AllProductsEntities?>>(mockedResult);
    when(productRepo.getAllProducts()).thenAnswer((_) async => mockedResult);

    var result = await productRepo.getAllProducts();
    expect(result, mockedResult);
    verify(productRepo.getAllProducts());
  });
}