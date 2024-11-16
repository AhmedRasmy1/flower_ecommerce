import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/register_entities.dart';
import 'signup_state.dart';

import '../../../domain/use_cases/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  //static RegisterViewModel get(context) => BlocProvider.of(context);

  RegisterViewModel(this._registerUseCase) : super(InitialState());
  bool isSelectGender =false;

  void doIntent(RegisterAction intent) async {
    switch (intent) {
      case RegisterAction():
        _register(intent);
    }
  }

  void _register(RegisterAction registerAction) async {
    emit(LoadingRegisterState());
    String gender = SharedData.getData(key: StringCache.selectGender) ?? '';
    var result = await _registerUseCase.register(
        registerAction.firstName,
        registerAction.lastName,
        registerAction.email,
        registerAction.password,
        gender,///
        registerAction. rePassword,
        registerAction. phone);

    switch (result) {
      case Success<RegisterEntities?>():
        emit(SuccessRegisterState(result.data));
      case Fail<RegisterEntities?>():
        print(result.exception);
        emit(ErrorRegisterState(result.exception));
    }
  }
}


