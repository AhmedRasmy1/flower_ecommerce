import 'package:flower_ecommerce/Features/auth/domain/entities/forget_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/verify_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../data_sources/auth_online_datasource.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_offline_datasource.dart';
import '../models/request/RegisterModelDto.dart';
import '../models/request/forget_password_request/reset_password_request.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(
    this.offLineDataSource,
    this.onLineDataSource,
  );

  @override
  Future<Result<RegisterEntities?>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String gender,
      String rePassword,
      String phone) {
    return onLineDataSource.register(RegisterModelDto(
      email: email,
      firstName: firstName,
      gender: gender,
      rePassword: rePassword,
      phone: phone,
      password: password,
      lastName: lastName,
    ));
  }

  @override
  Future<Result<LoginEntitie>> login(String email, String password) {
    return onLineDataSource.login(LoginModelDto(
      email: email,
      password: password,
    ));
  }

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    return onLineDataSource.forgetPassword(email);
  }

  @override
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp) {
    return onLineDataSource.verifyPassword(otp);
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) {
    return onLineDataSource.resetPassword(
        ResetPasswordRequest(email: email, newPassword: newPassword));
  }
}
