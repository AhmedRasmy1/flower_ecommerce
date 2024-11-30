
import 'package:flower_ecommerce/Features/profile_reset_password/domain/entities/change_password_entity.dart';

sealed class ChangePasswordState{}
class ChangePasswordInitialState extends ChangePasswordState{}
class ChangePasswordLoadingState extends ChangePasswordState{}
class ChangePasswordErrorState extends ChangePasswordState{
  Exception? exception;
  ChangePasswordErrorState(this.exception);
}
class ChangePasswordSuccessState extends ChangePasswordState{
  ChangePasswordEntity? response;
  ChangePasswordSuccessState(this.response);
}

