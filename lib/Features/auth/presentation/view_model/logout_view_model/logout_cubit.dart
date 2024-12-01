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
import 'package:flower_ecommerce/Features/auth/domain/entities/logout_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/use_cases/logout_usecases.dart';
import 'package:flower_ecommerce/Features/auth/presentation/view_model/logout_view_model/logout_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LogoutViewModel extends Cubit<LogoutState> {
  final LogoutUseCases logoutUseCases;

  LogoutViewModel(this.logoutUseCases) : super(InitialState());

  Future<void> logout(String token) async {
    emit(LoadingLogoutState());

    var result = await logoutUseCases.logout(token);

    print("==========================================");
    print(SharedData.getData(key: StringCache.userToken));
    switch (result) {
      case Success<LogoutEntity>():
        SharedData.deleteItem(key: StringCache.userToken);
        print("==========================================");
        print(SharedData.getData(key: StringCache.userToken));
        emit(SuccessLogoutState(result.data));
      case Fail<LogoutEntity>():
        emit(ErrorLogoutState(result.exception));
        print(result.exception);
    }
  }
}
