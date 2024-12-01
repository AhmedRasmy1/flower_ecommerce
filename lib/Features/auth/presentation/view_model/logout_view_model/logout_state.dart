import 'package:flower_ecommerce/Features/auth/domain/entities/logout_entity.dart';

import '../../../domain/entities/login_entities.dart';

sealed class LogoutState {}

class InitialState extends LogoutState {}

class SuccessLogoutState extends LogoutState {
  LogoutEntity logoutEntity;

  SuccessLogoutState(this.logoutEntity);
}

class LoadingLogoutState extends LogoutState {}

class ErrorLogoutState extends LogoutState {
  Exception? exception;

  ErrorLogoutState(this.exception);
}
