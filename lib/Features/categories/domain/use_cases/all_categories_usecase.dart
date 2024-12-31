import '../entities/categories_entities.dart';
import '../repositories/categories_repo.dart';
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
