part of 'delete_product_view_model.dart';

@immutable
sealed class DeleteProductState {}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {}

final class DeleteProductSuccess extends DeleteProductState {}

final class DeleteProductFailure extends DeleteProductState {
  final Exception exception;
  DeleteProductFailure(this.exception);
}
