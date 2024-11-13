import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/register_entities.dart';
import 'signup_state.dart';

import '../../../domain/use_cases/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterViewModel(this.registerUseCase) : super(InitialState());

  void register(
      // {
      // required String firstName,
      // required String lastName,
      // required String email,
      // required String password,
      // required String gender,
      // required String rePassword,
      // required String phone}
      ) async {
    var result = await registerUseCase.register(
        'fivcrsxtakjkName',
        'dfdjkdffcdf',
        'dfdf1ddkzjl2ass@gmail.com',
        'As@112233',
        'male',
        'As@112233',
        '+201258501121');

    switch (result) {
      case Success<RegisterEntities?>():
        emit(SuccessRegisterState(result.data));
      case Fail<RegisterEntities?>():
        print(result.exception);
        emit(ErrorRegisterState(result.exception));
    }
  }
}
