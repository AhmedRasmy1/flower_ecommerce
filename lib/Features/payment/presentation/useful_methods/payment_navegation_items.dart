import '../../../cart&checkout/domain/entities/cart_item_entity.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../../data/model/response/cash_order_response/OrderItems.dart';

class PaymentNavigationItems {
  PaymentNavigationItems(
      {required this.paymentCheckoutRequest, required this.orderItems});
  PaymentCheckoutRequest paymentCheckoutRequest;
  List<CartItemEntity> orderItems;
}
