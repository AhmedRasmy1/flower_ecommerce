import 'package:flower_ecommerce/Features/categories/domain/entities/categories_entities.dart';
import 'package:flower_ecommerce/Features/products/domain/entities/ProductsEntities.dart';
import 'package:flower_ecommerce/Features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../data_sources/all_products_datasource.dart';


@Injectable(as: ProductsRepo)
class CategoriesRepoImpl implements ProductsRepo {
  AllProductsDatasource allProductsDatasource;

  CategoriesRepoImpl(this.allProductsDatasource);

  @override
  Future<Result<AllProductsEntities?>> getAllProducts() {
    return allProductsDatasource.getAllProducts();
  }
}
