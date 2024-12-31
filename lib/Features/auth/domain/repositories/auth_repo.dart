import '../entities/logout_entity.dart';

import '../entities/forget_password_entity.dart';

import '../entities/verify_password_entity.dart';
import '../entities/login_entities.dart';
import '../../../../core/common/api_result.dart';
import '../entities/register_entities.dart';
import '../entities/reset_password_entity.dart';

abstract class AuthRepo {
  Future<Result<RegisterEntities?>> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
    String gender,
  );
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword);
  Future<Result<LoginEntitie>> login(String name, String password);
  Future<Result<LogoutEntity>> logout(String token);
}
