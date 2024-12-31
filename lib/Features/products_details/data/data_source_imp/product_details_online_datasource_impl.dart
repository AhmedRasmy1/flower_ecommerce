import '../data_sources/product_details_online_datasource.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsOnlineDataSource)
class ProductDetailsOnlineDataSourceImp extends ProductDetailsOnlineDataSource {
  final ApiService _productDetailsRetrofit;

  ProductDetailsOnlineDataSourceImp(this._productDetailsRetrofit);
  @override
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId) {
    return executeApi(() async {
      var response = await _productDetailsRetrofit.getProductDetails(productId);
      // print("Full API Response: ${response.product}");
      // Check if the product is null
      if (response.product == null) {
        // Log the message or return a failure result
        // print("Product is null: ${response.message}");
        throw Exception("Failed to fetch product details: ${response.message}");
      }

      // Convert the product to an entity and return
      return response.product!.toProductDetailsEntity();
    });
  }
}
