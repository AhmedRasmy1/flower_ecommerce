import '../../domain/entities/product_details_entity.dart';

sealed class ProductDetailsState {}

class InitialState extends ProductDetailsState {}

class SuccessProductDetailsState extends ProductDetailsState {
  ProductDetailsEntity productDetailsEntity;

  SuccessProductDetailsState(this.productDetailsEntity);
}

class LoadingProductDetailsState extends ProductDetailsState {}

class ErrorProductDetailsState extends ProductDetailsState {
  Exception? exception;

  ErrorProductDetailsState(this.exception);
}
