import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/register_entities.dart';
import 'signup_state.dart';

import '../../../domain/use_cases/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  //static RegisterViewModel get(context) => BlocProvider.of(context);

  RegisterViewModel(this.registerUseCase) : super(InitialState());
  bool genderChosen=false;

  void register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    emit(LoadingRegisterState());
    String gender = SharedData.getData(key: StringCache.selectGender)??'';
    var result = await registerUseCase.register(firstName, lastName, email,
        password, gender, rePassword, phone);

    switch (result) {
      case Success<RegisterEntities?>():
        emit(SuccessRegisterState(result.data));
      case Fail<RegisterEntities?>():
        print(result.exception);
        emit(ErrorRegisterState(result.exception));
    }
  }
}
