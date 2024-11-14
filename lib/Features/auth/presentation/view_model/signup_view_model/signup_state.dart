

import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';

sealed class RegisterState {}

class InitialState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterEntities? registerEntities;

  SuccessRegisterState(this.registerEntities);
}

class LoadingRegisterState extends RegisterState {

  LoadingRegisterState();
}

class ErrorRegisterState extends RegisterState {
  Exception? exception;

  ErrorRegisterState(this.exception);
}
