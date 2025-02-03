
import '../../domain/entities/user_orders_response_entity.dart';

sealed class OrdersState {}

class InitialState extends OrdersState {}

class SuccessOrdersState extends OrdersState {
  UserOrdersResponseEntity? userOrdersResponseEntity;

  SuccessOrdersState(this.userOrdersResponseEntity);
}

class LoadingOrdersState extends OrdersState {}

class ErrorOrdersState extends OrdersState {
  Exception? exception;

  ErrorOrdersState(this.exception);
}
