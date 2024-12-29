import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/orders_response_entity.dart';
import '../../domain/use_case/user_orders_use_case.dart';
import 'orders_state.dart';


@injectable
class OrdersViewModel extends Cubit<OrdersState> {
  UserOrdersUseCase ordersUseCase;
  OrdersViewModel(this.ordersUseCase) : super(InitialState());

  Future<void> getUserOrders(String token) async {
    emit(LoadingOrdersState());

    var result = await ordersUseCase.invoke(token);

    switch (result) {
      case Success<OrdersResponseEntity?>():
        emit(SuccessOrdersState(result.data));
      case Fail<OrdersResponseEntity?>():
        emit(ErrorOrdersState(result.exception));
    }
  }
}
