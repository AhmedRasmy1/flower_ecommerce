

import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';

import '../../../../core/common/api_result.dart';
import '../../data/model/request/payment_checkout_request.dart';

abstract class PaymentCheckoutRepo {
  Future<Result<PaymentCheckoutResponse?>> getPaymentCheckout(PaymentCheckoutRequest paymentRequest,String token);
}
