import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';
import 'package:flower_ecommerce/Features/auth/domain/repositories/auth_repo.dart';
import 'package:flower_ecommerce/Features/auth/domain/use_cases/register_usecase.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'register_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo authRepo;
  late RegisterUseCase registerUseCase;

  setUp(() {
    authRepo = MockAuthRepo();
    registerUseCase = RegisterUseCase(authRepo);
  });

  test('when call register it calls authRepo.register with correct parameters',
      () async {
    var firstName = 'firstName';
    var lastName = 'lastName';
    var email = 'email';
    var password = 'password';
    var rePassword = 'rePassword';
    var phone = 'phone';
    var gender = 'gender';

    var mockedResult = Success(RegisterEntities());

    when(authRepo.register(
            firstName, lastName, email, password, rePassword, phone, gender))
        .thenAnswer((_) async => mockedResult);

    var result = await registerUseCase.register(
        firstName, lastName, email, password, rePassword, phone, gender);

    expect(result, mockedResult);
    verify(authRepo.register(
            firstName, lastName, email, password, rePassword, phone, gender))
        .called(1);
  });
}
