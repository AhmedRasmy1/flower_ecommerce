import '../entities/categories_entities.dart';

import '../../../../core/common/api_result.dart';

abstract class CategoriesRepo {
  Future<Result<AllCategoriesEntities?>> getAllCategories();
}
