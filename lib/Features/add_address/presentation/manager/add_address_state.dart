part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

class SuccessAddAddressState extends AddAddressState {
  final AddAddressEntity? addAddressEntity;

  SuccessAddAddressState(this.addAddressEntity);
}

class LoadingAddAddressState extends AddAddressState {}

class ErrorAddAddressState extends AddAddressState {
  final Exception? exception;

  ErrorAddAddressState(this.exception);
}

class ChangeAddressState extends AddAddressState {
  final String address;

  ChangeAddressState(this.address);
}

class ChangeCityState extends AddAddressState {
  final int area;

  ChangeCityState(this.area);
}

sealed class AddAddressToAction {}

class DoAddAddressToAction extends AddAddressToAction {
  AddAddressRequest addAddressRequest;
  DoAddAddressToAction(this.addAddressRequest);
}
