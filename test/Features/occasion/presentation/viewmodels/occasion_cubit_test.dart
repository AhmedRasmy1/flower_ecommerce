import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/occasions/data/models/occasion_response/occasion_response.dart';
import 'package:flower_ecommerce/Features/occasions/domain/use_cases/occasion_use_case.dart';
import 'package:flower_ecommerce/Features/occasions/presentation/viewmodel/occasion_view_model/occasion_cubit.dart';
import 'package:flower_ecommerce/Features/occasions/presentation/viewmodel/occasion_view_model/occasion_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_cubit_test.mocks.dart';

@GenerateMocks([OccasionUseCase])
void main() {
  group('OccasionViewModel Tests', () {
    late MockOccasionUseCase mockOccasionUseCase;
    late OccasionViewModel occasionViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockOccasionUseCase = MockOccasionUseCase();
      occasionViewModel = OccasionViewModel(mockOccasionUseCase);
    });

    blocTest<OccasionViewModel, OccasionState>(
      'when calling getOccasions, it should call getOccasions from the useCase and change state correctly',
      build: () {
        // Prepare a mock result
        var result = Success<OccasionResponse?>(
            OccasionResponse()); // Mock a successful response
        when(mockOccasionUseCase.getOccasions())
            .thenAnswer((_) async => result);

        return occasionViewModel;
      },
      act: (viewModel) {
        viewModel.getOccasions(); // Trigger the action to get occasions
      },
      expect: () => [
        isA<LoadingOccasionState>(), // Expect Loading state first
        isA<SuccessOccasionState>(), // Then expect Success state
      ],
    );

    blocTest<OccasionViewModel, OccasionState>(
      'when calling getOccasions, it should handle failure correctly',
      build: () {
        // Prepare a mock failure result
        var result = Fail<OccasionResponse?>(Exception("Some error occurred"));
        when(mockOccasionUseCase.getOccasions())
            .thenAnswer((_) async => result);

        return occasionViewModel;
      },
      act: (viewModel) {
        viewModel.getOccasions(); // Trigger the action to get occasions
      },
      expect: () => [
        isA<LoadingOccasionState>(), // Expect Loading state first
        isA<ErrorOccasionState>(), // Then expect Error state
      ],
    );
  });
}
