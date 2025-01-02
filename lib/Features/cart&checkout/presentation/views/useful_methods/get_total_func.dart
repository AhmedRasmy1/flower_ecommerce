import '../../../domain/entities/cart_item_entity.dart';

double getTotal(List<CartItemEntity> cartList) {
  double total = 0;
  for (var item in cartList) {
    total += item.quantity! * item.price!.toDouble();
  }
  return total;
}