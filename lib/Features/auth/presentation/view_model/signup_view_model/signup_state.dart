

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



sealed class RegisterToAction {}

class RegisterAction extends RegisterToAction {
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  RegisterAction(
      {required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.rePassword,
        required this.phone});
}