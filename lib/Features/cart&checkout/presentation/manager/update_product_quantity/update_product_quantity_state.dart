part of 'update_product_quantity_view_model.dart';

@immutable
sealed class UpdateProductQuantityState {}

final class UpdateProductQuantityViewModelInitial
    extends UpdateProductQuantityState {}

final class UpdateProductQuantityLoading extends UpdateProductQuantityState {}

final class UpdateProductQuantitySuccess extends UpdateProductQuantityState {}

final class UpdateProductQuantityFailure extends UpdateProductQuantityState {
  final Exception exception;
  UpdateProductQuantityFailure(this.exception);
}
