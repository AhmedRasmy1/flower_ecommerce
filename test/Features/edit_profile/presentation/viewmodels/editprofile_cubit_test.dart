import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/edit_profile/data/models/user.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:flower_ecommerce/Features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:flower_ecommerce/Features/edit_profile/presentation/viewmodels/editprofile_cubit.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editprofile_cubit_test.mocks.dart';

@GenerateMocks([EditProfileUseCase])
void main() {
  late EditprofileCubit editprofileCubit;
  late EditProfileUseCase mockEditProfileUseCase;

  setUp(() async {
    SharedPreferences.setMockInitialValues(
        {CacheConstants.userToken: 'fakeToken'});
    final sharedPreferences = await SharedPreferences.getInstance();
    CacheService.sharedPreferences = sharedPreferences;
    mockEditProfileUseCase = MockEditProfileUseCase();
    editprofileCubit = EditprofileCubit(mockEditProfileUseCase);
  });

  blocTest<EditprofileCubit, EditprofileState>(
    'Ensure editProfile emits [EditprofileLoading, EditprofileSuccess] when the use case succeeds.',
    build: () {
      var mockedResult = Success<EditProfileEntity>(
        EditProfileEntity(
          message: 'Fake message',
          user: User(
            firstName: 'Ahmed',
            lastName: 'Mido',
            email: 'Fake_email',
            phone: 'Fake_phone',
          ),
        ),
      );
      when(mockEditProfileUseCase.editProfile(
        'Bearer fakeToken',
        'Ahmed',
        'Mido',
        'Fake_email',
        'Fake_phone',
      )).thenAnswer((_) async => mockedResult);

      return editprofileCubit;
    },
    act: (editprofileCubit) => editprofileCubit.editProfile(
      'Ahmed',
      'Mido',
      'Fake_email',
      'Fake_phone',
    ),
    expect: () => [
      isA<EditprofileLoading>(),
      isA<EditprofileSuccess>(),
    ],
    verify: (_) {
      verify(mockEditProfileUseCase.editProfile(
        'Bearer fakeToken',
        'Ahmed',
        'Mido',
        'Fake_email',
        'Fake_phone',
      )).called(1);
    },
  );

  blocTest<EditprofileCubit, EditprofileState>(
    'Ensure editProfile emits [EditprofileLoading, EditprofileFail] when the use case fails.',
    build: () {
      var mockedResult = Fail<EditProfileEntity>(Exception('Error'));
      when(mockEditProfileUseCase.editProfile(
        'Bearer fakeToken',
        'Ahmed',
        'Mido',
        'Fake_email',
        'Fake_phone',
      )).thenAnswer((_) async => mockedResult);

      return editprofileCubit;
    },
    act: (editprofileCubit) => editprofileCubit.editProfile(
      'Ahmed',
      'Mido',
      'Fake_email',
      'Fake_phone',
    ),
    expect: () => [
      isA<EditprofileLoading>(),
      isA<EditprofileFail>(),
    ],
    verify: (_) {
      verify(mockEditProfileUseCase.editProfile(
        'Bearer fakeToken',
        'Ahmed',
        'Mido',
        'Fake_email',
        'Fake_phone',
      )).called(1);
    },
  );
}
