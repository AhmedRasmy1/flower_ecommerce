import '../../domain/entities/categories_entities.dart';
import '../../../../core/common/api_result.dart';

abstract class AllCategoriesDatasource {
  Future<Result<AllCategoriesEntities?>> getAllCategories();
}
