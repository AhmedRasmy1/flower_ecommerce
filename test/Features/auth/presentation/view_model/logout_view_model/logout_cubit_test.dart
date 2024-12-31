import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/logout_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/use_cases/logout_usecases.dart';
import 'package:flower_ecommerce/Features/auth/presentation/view_model/logout_view_model/logout_cubit.dart';
import 'package:flower_ecommerce/Features/auth/presentation/view_model/logout_view_model/logout_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logout_cubit_test.mocks.dart';

@GenerateMocks([LogoutUseCases])
void main() {
  late LogoutViewModel logoutViewModel;
  late LogoutUseCases mockLogoutUseCases;

  setUp(() async {
    SharedPreferences.setMockInitialValues(
        {CacheConstants.userToken: 'fakeToken'});
    final sharedPreferences = await SharedPreferences.getInstance();
    CacheService.sharedPreferences = sharedPreferences;
    mockLogoutUseCases = MockLogoutUseCases();
    logoutViewModel = LogoutViewModel(mockLogoutUseCases);
  });

  blocTest<LogoutViewModel, LogoutState>(
    'Ensure login emits [LogoutLoading, LogoutSuccess] when the use case succeeds.',
    build: () {
      var mockedResult = Success<LogoutEntity>(
        LogoutEntity(
          message: 'Fake message',
        ),
      );
      when(mockLogoutUseCases.logout(
        'Fake_token',
      )).thenAnswer((_) async => mockedResult);

      return logoutViewModel;
    },
    act: (logoutViewModel) => logoutViewModel.logout(
      'Fake_token',
    ),
    expect: () => [
      isA<LoadingLogoutState>(),
      isA<SuccessLogoutState>(),
    ],
    verify: (_) {
      verify(mockLogoutUseCases.logout(
        'Fake_token',
      )).called(1);
    },
  );

  blocTest<LogoutViewModel, LogoutState>(
    'Ensure login emits [LogoutLoading, LogoutFail] when the use case fails.',
    build: () {
      var mockedResult = Fail<LogoutEntity>(Exception('Error'));
      when(mockLogoutUseCases.logout(
        'Fake_token',
      )).thenAnswer((_) async => mockedResult);

      return logoutViewModel;
    },
    act: (logoutviewmodel) => logoutviewmodel.logout(
      'Fake_token',
    ),
    expect: () => [
      isA<LoadingLogoutState>(),
      isA<ErrorLogoutState>(),
    ],
    verify: (_) {
      verify(mockLogoutUseCases.logout(
        'Fake_token',
      )).called(1);
    },
  );
}
