import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';
import 'package:flower_ecommerce/Features/categories/domain/entities/categories_entities.dart';
import 'package:flower_ecommerce/Features/categories/domain/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepo categoriesRepo;

  CategoriesUseCase(this.categoriesRepo);

  Future<Result<AllCategoriesEntities?>> getAllCategories() {
    return categoriesRepo.getAllCategories();
  }
}
