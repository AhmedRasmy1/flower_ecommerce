import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/use_cases/address_use_cases.dart';
import 'package:flower_ecommerce/Features/address/saved_address/presentation/view_models/get_address/address_cubit.dart';
import 'package:flower_ecommerce/Features/address/saved_address/presentation/view_models/get_address/address_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'address_cubit_test.mocks.dart';

@GenerateMocks([AddressUseCases])
void main() {
  late MockAddressUseCases mockUseCases;
  late AddressViewModel viewModel;

  setUp(() {
    mockUseCases = MockAddressUseCases();
    viewModel = AddressViewModel(mockUseCases);
  });

  const token = 'token';

  group('getAddress', () {
    blocTest<AddressViewModel, AddressState>(
      'emits [LoadingAddressState, SuccessAddressState] when fetching addresses is successful',
      build: () {
        var result = Success<AllAddressEntity>(AllAddressEntity());
        when(mockUseCases.getAddresses(token)).thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.getAddress(token),
      expect: () => [
        isA<LoadingAddressState>(),
        isA<SuccessAddressState>(),
      ],
      verify: (_) {
        verify(mockUseCases.getAddresses(token)).called(1);
      },
    );

    blocTest<AddressViewModel, AddressState>(
      'emits [LoadingAddressState, ErrorAddressState] when fetching addresses fails',
      build: () {
        var result = Fail<AllAddressEntity>(Exception("Failed to fetch"));
        when(mockUseCases.getAddresses(token)).thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.getAddress(token),
      expect: () => [
        isA<LoadingAddressState>(),
        isA<ErrorAddressState>(),
      ],
    );
  });
}
