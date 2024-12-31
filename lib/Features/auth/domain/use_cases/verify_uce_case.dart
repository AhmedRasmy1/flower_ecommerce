import '../entities/verify_password_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repositories/auth_repo.dart';

@injectable
class VerifyUseCase {
  AuthRepo authRepo;
  VerifyUseCase(this.authRepo);

  Future<Result<VerifyPasswordEntity?>> invoke(String otp) {
    return authRepo.verifyPassword(otp);
  }
}
