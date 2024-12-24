import '../../domain/entities/products_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'all_products_datasource.dart';

@Injectable(as: AllProductsDatasource)
class AllProductsDatasourceImpl implements AllProductsDatasource {
  final ApiService _authRetrofit;

  AllProductsDatasourceImpl(this._authRetrofit);

  @override
  Future<Result<AllProductsEntities?>> getAllProducts(String? sortType) {
    return executeApi(() async {
      print('api$sortType');
      var response = await _authRetrofit.getAllProducts(sortType);
      print(response.products);
      return response.toAllProductsEntities();
    });
  }
}
