import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/Features/profile/domain/use_cases/profile_usecase.dart';
import 'package:flower_ecommerce/Features/profile/presentation/view_model/profile_state.dart';
import 'package:flower_ecommerce/Features/profile/presentation/view_model/profile_view_model.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'profile_cubit_test.mocks.dart';

@GenerateMocks([ProfileUseCase])
void main() {
  group('ProfileViewModel Tests', () {
    late MockProfileUseCase mockProfileUseCase;
    late ProfileViewModel profileViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockProfileUseCase = MockProfileUseCase();
      profileViewModel = ProfileViewModel(mockProfileUseCase);
    });

    // blocTest<ProfileViewModel, ProfileState>(
    //   'when calling getProfile, it should call getProfile from the useCase and change state correctly',
    //   build: () {
    //     String token = "Bearer token";
    //     // Prepare a mock result
    //     var result = Success<ProfileEntity?>(
    //         ProfileEntity()); // Mock a successful response
    //     when(mockProfileUseCase.getProfileData(token))
    //         .thenAnswer((_) async => result);

    //     return profileViewModel;
    //   },
    //   act: (viewModel) {
    //     viewModel.getProfileData("Bearer token");
    //     // Trigger the action to get occasions
    //   },
    //   expect: () => [
    //     isA<LoadingProfileState>(), // Expect Loading state first
    //     isA<SuccessProfileState>(), // Then expect Success state
    //   ],
    // );

    blocTest<ProfileViewModel, ProfileState>(
      'when calling getProfile, it should handle failure correctly',
      build: () {
        // Prepare a mock failure result
        var result = Fail<ProfileEntity?>(Exception("Some error occurred"));
        when(mockProfileUseCase.getProfileData("token"))
            .thenAnswer((_) async => result);

        return profileViewModel;
      },
      act: (viewModel) {
        viewModel
            .getProfileData("token"); // Trigger the action to get occasions
      },
      expect: () => [
        isA<LoadingProfileState>(), // Expect Loading state first
        isA<ErrorProfileState>(), // Then expect Error state
      ],
    );
  });
}
