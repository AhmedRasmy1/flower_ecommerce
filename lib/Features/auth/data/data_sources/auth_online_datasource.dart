
import 'package:flower_ecommerce/Features/auth/domain/entities/forget_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/verify_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';


import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../models/request/RegisterModelDto.dart';
import '../models/request/forget_password_request/reset_password_request.dart';

abstract class AuthOnLineDataSource {
  Future<Result<RegisterEntities?>> register(RegisterModelDto registerModelDto);

  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto);

}
