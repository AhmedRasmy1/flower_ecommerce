import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../domain/entities/logout_entity.dart';
import '../../../domain/use_cases/logout_usecases.dart';
import 'logout_state.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutViewModel extends Cubit<LogoutState> {
  final LogoutUseCases logoutUseCases;

  LogoutViewModel(this.logoutUseCases) : super(InitialState());

  Future<void> logout(String token) async {
    emit(LoadingLogoutState());

    var result = await logoutUseCases.logout(token);

    log(SharedData.getData(key: StringCache.userToken));
    switch (result) {
      case Success<LogoutEntity>():
        SharedData.deleteItem(key: StringCache.userToken);
        log(SharedData.getData(key: StringCache.userToken));
        emit(SuccessLogoutState(result.data));
      case Fail<LogoutEntity>():
        emit(ErrorLogoutState(result.exception));
        log(result.exception.toString());
    }
  }
}
