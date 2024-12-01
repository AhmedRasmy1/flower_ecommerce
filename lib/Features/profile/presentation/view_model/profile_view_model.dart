import 'package:bloc/bloc.dart';
import '../../domain/entities/profile_entity.dart';
import 'profile_state.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

import '../../domain/use_cases/profile_usecase.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileUseCase profileUseCase;

  ProfileViewModel(this.profileUseCase) : super(InitialState());
  void getProfileData(String token) async {
    emit(LoadingProfileState());
    var result = await profileUseCase.getProfileData(token);
    switch (result) {
      case Success<ProfileEntity?>():
        await Future.wait([
          SharedData.setData(
              key: StringCache.userFirstName,
              value: result.data!.user!.firstName ?? ''),
          SharedData.setData(
              key: StringCache.userLastName,
              value: result.data!.user!.lastName ?? ''),
          SharedData.setData(
              key: StringCache.userEmail,
              value: result.data!.user!.email ?? ''),
          SharedData.setData(
              key: StringCache.userPhone,
              value: result.data!.user!.phone ?? ''),
        ]);
        emit(SuccessProfileState(result.data));
      case Fail<ProfileEntity?>():
        emit(ErrorProfileState(result.exception));
    }
  }
}
