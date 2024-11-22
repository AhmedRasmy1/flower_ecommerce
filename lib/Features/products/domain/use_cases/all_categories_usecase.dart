import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';
import 'package:flower_ecommerce/Features/categories/domain/entities/categories_entities.dart';
import 'package:flower_ecommerce/Features/categories/domain/repositories/categories_repo.dart';
import 'package:flower_ecommerce/Features/products/domain/entities/ProductsEntities.dart';
import 'package:flower_ecommerce/Features/products/domain/repositories/products_repo.dart';
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
