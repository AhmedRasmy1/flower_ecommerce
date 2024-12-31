import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/forget_password_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<Result<ForgetPasswordEntity?>> invoke(String email) {
    return authRepo.forgetPassword(email);
  }
}
