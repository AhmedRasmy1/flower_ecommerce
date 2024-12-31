import '../data_sources/product_details_online_datasource.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../domain/repositories/product_details_repo.dart';
import '../../../../core/common/api_result.dart';
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
