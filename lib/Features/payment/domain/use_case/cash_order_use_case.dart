
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../../data/model/response/cash_order_response/cash_order_response.dart';
import '../repositories/cash_order_repo.dart';

@injectable
class CashOrderUseCase {
  CashOrderRepo cashOrderRepo;

  CashOrderUseCase(this.cashOrderRepo);

  Future<Result<CashOrderResponse?>> invoke(PaymentCheckoutRequest paymentRequest,String token) {
    return cashOrderRepo.getCashOrder(paymentRequest,token);
  }
}
