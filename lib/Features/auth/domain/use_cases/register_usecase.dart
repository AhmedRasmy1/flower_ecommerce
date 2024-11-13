import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repositories/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Result<RegisterEntities?>> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
    String gender,
  ) {
    return authRepo.register(
        firstName, lastName, email, password, rePassword, phone, gender);
  }
}
