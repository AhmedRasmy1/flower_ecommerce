import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/reset_password_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);

  Future<Result<ResetPasswordEntity?>> invoke(
      String email, String newPassword) {
    return authRepo.resetPassword(email, newPassword);
  }
}
