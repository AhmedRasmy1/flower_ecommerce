import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/use_case/best_seller_use_case.dart';
import 'package:flower_ecommerce/Features/best_seller/presentation/best_seller_view_model/best_seller_cubit.dart';
import 'package:flower_ecommerce/Features/best_seller/presentation/best_seller_view_model/best_seller_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_cubit_test.mocks.dart';

@GenerateMocks([BestSellerUseCase])
void main() {
  group('BestSellerViewModel Tests', () {
    late MockBestSellerUseCase mockBestSellerUseCase;
    late BestSellerViewModel bestSellerViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockBestSellerUseCase = MockBestSellerUseCase();
      bestSellerViewModel = BestSellerViewModel(mockBestSellerUseCase);
    });

    blocTest<BestSellerViewModel, BestSellerState>(
      'when calling getOccasions, it should call getBestSeller from the useCase and change state correctly',
      build: () {
        // Prepare a mock result
        var bestSellerList = <BestSellerEntity>[];
        var result = Success<List<BestSellerEntity>>(bestSellerList);

        when(mockBestSellerUseCase.invoke()).thenAnswer((_) async => result);

        return bestSellerViewModel;
      },
      act: (viewModel) {
        viewModel.getBestSeller(); // Trigger the action to get occasions
      },
      expect: () => [
        isA<LoadingBestSellerState>(), // Expect Loading state first
        isA<SuccessBestSellerState>(), // Then expect Success state
      ],
    );

    blocTest<BestSellerViewModel, BestSellerState>(
      'when calling getBestSeller, it should handle failure correctly',
      build: () {
        // Prepare a mock failure result

        var result =
            Fail<List<BestSellerEntity>>(Exception("Some error occurred"));
        when(mockBestSellerUseCase.invoke()).thenAnswer((_) async => result);

        return bestSellerViewModel;
      },
      act: (viewModel) {
        viewModel.getBestSeller(); // Trigger the action to get occasions
      },
      expect: () => [
        isA<LoadingBestSellerState>(), // Expect Loading state first
        isA<ErrorBestSellerState>(), // Then expect Error state
      ],
    );
  });
}
