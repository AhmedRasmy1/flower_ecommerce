
import '../../../../core/common/api_result.dart';
import '../model/request/payment_checkout_request.dart';
import '../model/response/cash_order_response/cash_order_response.dart';

abstract class CashOrderOnLineDataSource {
  Future<Result<CashOrderResponse?>> getCashOrder(PaymentCheckoutRequest paymentRequest,String token);
}
