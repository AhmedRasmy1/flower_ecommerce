part of 'fetch_user_cart_view_model.dart';

@immutable
sealed class FetchUserCartState {}

final class FetchUserCartInitial extends FetchUserCartState {}

final class FetchUserCartLoading extends FetchUserCartState {
  final bool isFirst;

  FetchUserCartLoading({required this.isFirst});
}

final class FetchUserCartSuccess extends FetchUserCartState {
  final List<CartItemEntity>? cartItems;

  FetchUserCartSuccess(this.cartItems);
}

final class FetchUserCartFailure extends FetchUserCartState {
  final Exception exception;
  FetchUserCartFailure(this.exception);
}
