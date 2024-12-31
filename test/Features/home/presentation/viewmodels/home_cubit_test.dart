import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/Features/home/domain/use_cases/home_use_case.dart';
import 'package:flower_ecommerce/Features/home/presentation/viewmodels/home_cubit.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([HomeUseCase])
void main() {
  late HomeCubit homeCubit;
  late HomeUseCase homeUseCase;
  setUp(() {
    homeUseCase = MockHomeUseCase();
    homeCubit = HomeCubit(homeUseCase);
  });
  blocTest<HomeCubit, HomeState>(
    'Ensure getHomeData in HomeCubit emits the correct states, starting with HomeLoading and transitioning to HomeSuccess after fetching data via HomeUseCase',
    build: () {
      var mockedResult = Success<HomeEntity>(HomeEntity(
          message: 'Fake message',
          bestSeller: [],
          occasions: [],
          products: [],
          categories: []));
      when(homeUseCase.getHomeData()).thenAnswer((_) async => mockedResult);
      return homeCubit;
    },
    act: (homeCubit) => homeCubit.getHomeData(),
    expect: () {
      verify(homeUseCase.getHomeData()).called(1);
      return [
        isA<HomeLoading>(),
        isA<HomeSuccess>(),
      ];
    },
  );
  blocTest<HomeCubit, HomeState>(
    'Verify that getHomeData in HomeCubit transitions correctly from HomeLoading to HomeFail when an exception is thrown by HomeUseCase.',
    build: () {
      var mockedResult = Fail<HomeEntity>(Exception('Error'));
      when(homeUseCase.getHomeData()).thenAnswer((_) async => mockedResult);
      return homeCubit;
    },
    act: (homeCubit) => homeCubit.getHomeData(),
    expect: () {
      verify(homeUseCase.getHomeData()).called(1);
      return [
        isA<HomeLoading>(),
        isA<HomeFail>(),
      ];
    },
  );
}
