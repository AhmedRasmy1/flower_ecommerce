import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../../domain/use_cases/edit_profile_use_case.dart';

part 'editprofile_state.dart';

@injectable
class EditprofileCubit extends Cubit<EditprofileState> {
  final EditProfileUseCase _editProfileUseCase;

  EditprofileCubit(this._editProfileUseCase) : super(EditprofileInitial());

  Future<void> editProfile(
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  ) async {
    emit(EditprofileLoading());
    var token = "Bearer ${CacheService.getData(key: CacheConstants.userToken)}";
    log('===========$token');
    if (token.isEmpty) {
      emit(
        EditprofileFail(
          Exception("User token is missing"),
        ),
      );
      return;
    }
    var result = await _editProfileUseCase.editProfile(
      token,
      firstName,
      lastName,
      email,
      phone,
    );

    switch (result) {
      case Success<EditProfileEntity>():
        emit(EditprofileSuccess(result.data));
        log('===========${result.data}');
        break;
      case Fail<EditProfileEntity>():
        emit(EditprofileFail(result.exception));
        log('===========${result.exception}');
        break;
    }
  }
}
