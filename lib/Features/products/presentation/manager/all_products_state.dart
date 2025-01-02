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

class SearchAllProductsState extends AllProductsState {
  final List<ProductsEntities> filteredProducts;

  SearchAllProductsState(this.filteredProducts);
}


sealed class AllProductsToAction {}

class GetAllProductsAction extends AllProductsToAction {
  GetAllProductsAction();
}
