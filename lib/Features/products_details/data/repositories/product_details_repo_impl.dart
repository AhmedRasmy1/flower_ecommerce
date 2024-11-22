import 'package:flower_ecommerce/Features/products_details/data/data_sources/product_details_online_datasource.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/Features/products_details/domain/repositories/product_details_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl extends ProductDetailsRepo {
  ProductDetailsOnlineDataSource productDetailsOnlineDataSource;

  ProductDetailsRepoImpl(this.productDetailsOnlineDataSource);

  @override
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId) {
    return productDetailsOnlineDataSource.getProductDetails(productId);
  }
}
