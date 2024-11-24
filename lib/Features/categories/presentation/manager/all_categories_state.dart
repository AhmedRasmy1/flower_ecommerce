import '../../domain/entities/categories_entities.dart';

sealed class AllCategoriesState {}

class InitialState extends AllCategoriesState {}

class SuccessAllCategoriesState extends AllCategoriesState {
  AllCategoriesEntities? categoriesEntities;

  SuccessAllCategoriesState(this.categoriesEntities);
}

class LoadingAllCategoriesState extends AllCategoriesState {
  LoadingAllCategoriesState();
}

class ErrorAllCategoriesState extends AllCategoriesState {
  Exception? exception;

  ErrorAllCategoriesState(this.exception);
}

sealed class AllCategoriesToAction {}

class GetAllCategoriesAction extends AllCategoriesToAction {
  GetAllCategoriesAction();
}
