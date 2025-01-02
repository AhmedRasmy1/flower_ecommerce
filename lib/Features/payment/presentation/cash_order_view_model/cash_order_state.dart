
import '../../data/model/response/cash_order_response/cash_order_response.dart';

sealed class CashOrderState {}

class CashOrderInitialState extends CashOrderState {}

class CashOrderLoadingState extends CashOrderState {}

class CashOrderErrorState extends CashOrderState {
  Exception? exception;
  CashOrderErrorState(this.exception);
}

class CashOrderSuccessState extends CashOrderState {
  CashOrderResponse? response;
  CashOrderSuccessState(this.response);
}
