
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/cash_order_repo.dart';
import '../data_source/cash_order_online_data_source.dart';
import '../model/request/payment_checkout_request.dart';
import '../model/response/cash_order_response/cash_order_response.dart';

@Injectable(as: CashOrderRepo)
class CashOrderRepoImpl implements CashOrderRepo {
  CashOrderOnLineDataSource cashOrderOnLineDataSource;

  CashOrderRepoImpl(
      this.cashOrderOnLineDataSource,
      );

  @override
  Future<Result<CashOrderResponse?>> getCashOrder(PaymentCheckoutRequest paymentRequest,String token) {
    return cashOrderOnLineDataSource.getCashOrder(paymentRequest,token);
  }
}
