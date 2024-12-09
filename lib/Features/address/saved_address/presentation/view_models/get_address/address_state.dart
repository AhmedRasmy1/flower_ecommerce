import '../../../domain/entities/response/address_entity.dart';

sealed class AddressState {}

class InitialState extends AddressState {}

class SuccessAddressState extends AddressState {
  final AllAddressEntity addresses;

  SuccessAddressState(this.addresses);
}

class LoadingAddressState extends AddressState {}

class ErrorAddressState extends AddressState {
  Exception? exception;

  ErrorAddressState(this.exception);
}
