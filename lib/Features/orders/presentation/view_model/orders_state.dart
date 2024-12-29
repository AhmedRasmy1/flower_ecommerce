
import 'package:flower_ecommerce/Features/orders/domain/entities/orders_response_entity.dart';

sealed class OrdersState {}

class InitialState extends OrdersState {}

class SuccessOrdersState extends OrdersState {
  OrdersResponseEntity? ordersEntities;

  SuccessOrdersState(this.ordersEntities);
}

class LoadingOrdersState extends OrdersState {}

class ErrorOrdersState extends OrdersState {
  Exception? exception;

  ErrorOrdersState(this.exception);
}
