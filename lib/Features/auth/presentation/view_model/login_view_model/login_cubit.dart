// import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';
// import 'package:flower_ecommerce/Features/auth/domain/use_cases/login_usecases.dart';
// import 'package:flower_ecommerce/Features/auth/presentation/view_model/login_view_model/login_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import '../../../../../core/common/api_result.dart';
//
// @injectable
// class LoginViewModel extends Cubit<LoginState> {
//   LoginUseCases loginUseCases;
//   LoginViewModel(this.loginUseCases) : super(InitialState());
//
//   void login() async {
//     var result = await loginUseCases.login(
//       'dhhhass@gmail.com',
//       'As@1hbhj12233',
//     );
//
//     switch (result) {
//       case Success<LoginEntitie>():
//         emit(SuccessLoginState(result.data));
//         print('===========${result.data}');
//       case Fail<LoginEntitie>():
//         print(result.exception);
//         emit(ErrorLoginState(result.exception));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';
import 'package:flower_ecommerce/Features/auth/domain/use_cases/login_usecases.dart';
import 'package:flower_ecommerce/Features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/cashed_data_shared_preferences.dart';

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
  }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('user_token');
  // }
}
