import '../../domain/entities/categories_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'all_categories_datasource.dart';

@Injectable(as: AllCategoriesDatasource)
class AuthOnLineDataSourceImpl implements AllCategoriesDatasource {
  final ApiService _authRetrofit;

  AuthOnLineDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<AllCategoriesEntities?>> getAllCategories() {
    return executeApi(() async {
      var response = await _authRetrofit.getAllCategories();
      return response.toAllCategories();
    });
  }
}
