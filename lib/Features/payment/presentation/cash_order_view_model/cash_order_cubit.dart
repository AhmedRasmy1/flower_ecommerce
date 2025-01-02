
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../../data/model/response/cash_order_response/cash_order_response.dart';
import '../../domain/use_case/cash_order_use_case.dart';
import 'cash_order_state.dart';

@injectable
class CashOrderViewModel extends Cubit<CashOrderState> {
  CashOrderUseCase cashOrderUseCase;
  CashOrderViewModel(this.cashOrderUseCase) : super(CashOrderInitialState());

  Future<void> getCashOrder(PaymentCheckoutRequest paymentRequest,String token) async {
    emit(CashOrderLoadingState());

    var result = await cashOrderUseCase.invoke(paymentRequest,token);

    switch (result) {
      case Success<CashOrderResponse?>():
        emit(CashOrderSuccessState(result.data));
      case Fail<CashOrderResponse?>():
        emit( CashOrderErrorState(result.exception));
    }
  }
}
