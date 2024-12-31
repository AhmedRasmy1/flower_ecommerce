import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/use_cases/profile_usecase.dart';
import 'profile_state.dart';

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
          CacheService.setData(
              key: CacheConstants.userFirstName,
              value: result.data!.user!.firstName ?? ''),
          CacheService.setData(
              key: CacheConstants.userLastName,
              value: result.data!.user!.lastName ?? ''),
          CacheService.setData(
              key: CacheConstants.userEmail,
              value: result.data!.user!.email ?? ''),
          CacheService.setData(
              key: CacheConstants.userPhone,
              value: result.data!.user!.phone ?? ''),
        ]);
        emit(SuccessProfileState(result.data));
      case Fail<ProfileEntity?>():
        emit(ErrorProfileState(result.exception));
    }
  }
}
