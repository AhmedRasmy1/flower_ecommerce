import '../entities/products_entities.dart';
import '../repositories/products_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;

  ProductsUseCase(this.productsRepo);

  Future<Result<AllProductsEntities?>> getAllProducts() {
    return productsRepo.getAllProducts();
  }
}
