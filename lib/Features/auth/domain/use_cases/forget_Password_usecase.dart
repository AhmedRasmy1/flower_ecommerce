import 'package:flower_ecommerce/Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/forget_password_entity.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/common/api_result.dart';
import '../repositories/auth_repo.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo authRepo;

  ForgetPasswordUseCase(this.authRepo);

  Future<Result<ForgetPasswordEntity?>> invoke(String email) {
    return authRepo.forgetPassword(email);
  }
}
