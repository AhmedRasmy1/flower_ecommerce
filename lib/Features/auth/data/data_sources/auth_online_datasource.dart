
import 'package:flower_ecommerce/Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/verify_response.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/forget_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/verify_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/LoginResponseDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';


import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../models/request/RegisterModelDto.dart';

abstract class AuthOnLineDataSource {
  Future<Result<RegisterEntities?>> register(RegisterModelDto registerModelDto);

  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto);

}
