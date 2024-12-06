import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/use_cases/address_use_cases.dart';
import 'package:flower_ecommerce/Features/address/saved_address/presentation/view_models/remove_address/remove_cubit.dart';
import 'package:flower_ecommerce/Features/address/saved_address/presentation/view_models/remove_address/remove_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../get_address/address_cubit_test.mocks.dart';

@GenerateMocks([AddressUseCases])
void main() {
  late MockAddressUseCases mockUseCases;
  late RemoveAddressViewModel viewModel;

  setUp(() {
    mockUseCases = MockAddressUseCases();
    viewModel = RemoveAddressViewModel(mockUseCases);
  });

  const token = 'token';
  const addressId = 'id';

  group('getAddress', () {
    blocTest<RemoveAddressViewModel, RemoveAddressState>(
      'emits [LoadingRemoveAddressState, SuccessRemoveAddressState] when remove address is successful',
      build: () {
        var result = Success<AllAddressEntity>(AllAddressEntity());
        when(mockUseCases.removeAddress(token, addressId))
            .thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.removeAddress(token, addressId),
      expect: () => [
        isA<LoadingRemoveAddressState>(),
        isA<SuccessRemoveAddressState>(),
      ],
      verify: (_) {
        verify(mockUseCases.removeAddress(token, addressId)).called(1);
      },
    );

    blocTest<RemoveAddressViewModel, RemoveAddressState>(
      'emits [LoadingRemoveAddressState, ErrorRemoveAddressState] when remove address fails',
      build: () {
        var result = Fail<AllAddressEntity>(Exception("Failed to fetch"));
        when(mockUseCases.removeAddress(token, addressId))
            .thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.removeAddress(token, addressId),
      expect: () => [
        isA<LoadingRemoveAddressState>(),
        isA<ErrorRemoveAddressState>(),
      ],
    );
  });
}
