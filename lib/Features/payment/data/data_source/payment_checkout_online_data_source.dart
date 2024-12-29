import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';

import '../../../../core/common/api_result.dart';
import '../model/request/payment_checkout_request.dart';

abstract class PaymentCheckoutOnLineDataSource {
  Future<Result<PaymentCheckoutResponse?>> getPaymentCheckout(PaymentCheckoutRequest paymentRequest,String token);
}
