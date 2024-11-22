import 'package:flower_ecommerce/Features/products_details/data/data_sources/product_details_online_datasource.dart';
import 'package:flower_ecommerce/Features/products_details/data/models/response/product_details_dto.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/core/api/api_extentions.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';


// @Injectable(as: ProductDetailsOnlineDataSource)
// class ProductDetailsOnlineDataSourceImp extends ProductDetailsOnlineDataSource {
//   final ApiService _productDetailsRetrofit;
//
//   ProductDetailsOnlineDataSourceImp(this._productDetailsRetrofit);
//
//   @override
//   Future<Result<ProductDetailsEntity>> getProductDetails(String productId) {
//     return executeApi(() async {
//       var response = await _productDetailsRetrofit.getProductDetails(productId);
//       // if(response.product==null){
//       //   print(response.message);
//       // }
//      // return AuthMappers.toProductDetailsEntity(response);
//        return response.product!.toProductDetailsEntity();
//     });
//   }
// }

@Injectable(as: ProductDetailsOnlineDataSource)
class ProductDetailsOnlineDataSourceImp extends ProductDetailsOnlineDataSource {
  final ApiService _productDetailsRetrofit;

  ProductDetailsOnlineDataSourceImp(this._productDetailsRetrofit);
  @override
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId) {
    return executeApi(() async {
      var response = await _productDetailsRetrofit.getProductDetails(productId);
      print("Full API Response: ${response.product}");
      // Check if the product is null
      if (response.product == null) {
        // Log the message or return a failure result
        print("Product is null: ${response.message}");
        throw Exception("Failed to fetch product details: ${response.message}");
      }

      // Convert the product to an entity and return
      return response.product!.toProductDetailsEntity();
    });
  }


}

