
import 'package:flower_ecommerce/Features/payment/data/model/response/cash_order_response/cash_order_response.dart';

import '../../../../core/common/api_result.dart';
import '../../data/model/request/payment_checkout_request.dart';

abstract class CashOrderRepo {
  Future<Result<CashOrderResponse?>> getCashOrder(PaymentCheckoutRequest paymentRequest,String token);
}
