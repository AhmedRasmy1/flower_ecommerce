import 'package:bloc/bloc.dart';
import '../../../domain/entities/login_entities.dart';
import '../../../domain/use_cases/login_usecases.dart';
import 'login_state.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;
  bool rememberMe = false; // Track if "Remember Me" is selected

  LoginViewModel(this.loginUseCases) : super(InitialState());

  Future<void> login(String email, String password) async {
    emit(LoadingLoginState());

    var result = await loginUseCases.login(email, password);

    switch (result) {
      case Success<LoginEntitie>():
        if (rememberMe && result.data.token != null) {
          await _saveToken(result.data.token!);
        }
        await _saveToken(result.data.token!);
        // print("===========================================");
        // print(result.data.token);
        // print("===========================================");
        // print(StringCache.userToken);
        await _saveToken(result.data.token!);
        emit(SuccessLoginState(result.data));
      case Fail<LoginEntitie>():
        emit(ErrorLoginState(result.exception));
    }
  }

  Future<void> _saveToken(String token) async {
    SharedData.setData(key: StringCache.userToken, value: token);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('user_token', token);
    // StringCache.userToken = token;
    SharedData.setData(key: StringCache.userToken, value: token);
    //final prefs = await SharedPreferences.getInstance();
    //await prefs.setString('user_token', token);
  }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('user_token');
  // }
}
