import '../entities/login_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repositories/auth_repo.dart';

@injectable
class LoginUseCases {
  AuthRepo authRepo;

  LoginUseCases(this.authRepo);

  Future<Result<LoginEntitie>> login(
    String email,
    String password,
  ) {
    return authRepo.login(email, password);
  }
}
