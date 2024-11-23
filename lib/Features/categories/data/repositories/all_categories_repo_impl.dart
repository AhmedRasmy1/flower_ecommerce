import '../../domain/entities/categories_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/all_categories_datasource.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  AllCategoriesDatasource allCategoriesDatasource;

  CategoriesRepoImpl(this.allCategoriesDatasource);

  @override
  Future<Result<AllCategoriesEntities?>> getAllCategories() {
    return allCategoriesDatasource.getAllCategories();
  }
}
