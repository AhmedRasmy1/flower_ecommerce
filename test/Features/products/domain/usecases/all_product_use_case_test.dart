import 'package:flower_ecommerce/Features/products/domain/repositories/products_repo.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ProductsRepo])
void main() {
/*  test('when call getproducts it calls getproduct of product Repo', () async {
    var productRepo = MockProductsRepo();

    var mockedResult = (Success<AllProductsEntities?>(AllProductsEntities()));
    provideDummy<Result<AllProductsEntities?>>(mockedResult);
    when(productRepo.getAllProducts()).thenAnswer((_) async => mockedResult);

    var result = await productRepo.getAllProducts();
    expect(result, mockedResult);
    verify(productRepo.getAllProducts());
  });*/
}
