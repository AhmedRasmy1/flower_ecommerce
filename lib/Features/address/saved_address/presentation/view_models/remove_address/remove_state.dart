import '../../../domain/entities/response/address_entity.dart';

sealed class RemoveAddressState {}

class InitialState extends RemoveAddressState {}

class SuccessRemoveAddressState extends RemoveAddressState {
  final AllAddressEntity addresses;

  SuccessRemoveAddressState(this.addresses);
}

class LoadingRemoveAddressState extends RemoveAddressState {}

class ErrorRemoveAddressState extends RemoveAddressState {
  Exception? exception;

  ErrorRemoveAddressState(this.exception);
}
