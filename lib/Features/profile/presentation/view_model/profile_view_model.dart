import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/Features/profile/presentation/view_model/profile_state.dart';
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
        emit(SuccessProfileState(result.data));
      case Fail<ProfileEntity?>():
        emit(ErrorProfileState(result.exception));
    }
  }
}
