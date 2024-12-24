import '../../domain/entities/products_entities.dart';

sealed class AllProductsState {}

class InitialState extends AllProductsState {}

class SuccessAllProductsState extends AllProductsState {
  AllProductsEntities? categoriesEntities;

  SuccessAllProductsState(this.categoriesEntities);
}

class LoadingAllProductsState extends AllProductsState {
  LoadingAllProductsState();
}

class ErrorAllProductsState extends AllProductsState {
  Exception? exception;

  ErrorAllProductsState(this.exception);
}
class SortTypeUpdatedState extends AllProductsState {
  AllProductsEntities? categoriesEntities;

  final String sortType;
  SortTypeUpdatedState(this.sortType);
}

sealed class AllProductsToAction {}

class GetAllProductsAction extends AllProductsToAction {

  GetAllProductsAction();
}
abstract class AllProductsIntent {}

class UpdateSortTypeIntent extends AllProductsIntent {
  final String sortType;

  UpdateSortTypeIntent(this.sortType);
}

class FetchProductsIntent extends AllProductsIntent {}
