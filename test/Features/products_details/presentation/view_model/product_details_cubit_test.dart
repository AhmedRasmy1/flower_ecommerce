import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/Features/products_details/domain/use_cases/product_details_usecases.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/view_model/product_details_state.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/view_model/product_details_cubit.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

import 'product_details_cubit_test.mocks.dart';

@GenerateMocks([ProductDetailsUseCases])
void main() {
  late MockProductDetailsUseCases mockUseCases;
  late ProductDetailsViewModel viewModel;

  setUp(() {
    mockUseCases = MockProductDetailsUseCases();
    viewModel = ProductDetailsViewModel(mockUseCases);
  });

  const productId = '12345';

  group('getProductDetails', () {
    blocTest<ProductDetailsViewModel, ProductDetailsState>(
      'emits [LoadingProductDetailsState, SuccessProductDetailsState] when fetching details is successful',
      build: () {
        var result = Success<ProductDetailsEntity>(ProductDetailsEntity());
        when(mockUseCases.getProductDetails(productId))
            .thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.getProductDetails(productId),
      expect: () => [
        isA<LoadingProductDetailsState>(),
        isA<SuccessProductDetailsState>(),
      ],
      verify: (_) {
        verify(mockUseCases.getProductDetails(productId)).called(1);
      },
    );

    blocTest<ProductDetailsViewModel, ProductDetailsState>(
      'emits [LoadingProductDetailsState, ErrorProductDetailsState] when fetching details fails',
      build: () {
        var result = Fail<ProductDetailsEntity>(Exception("Failed to fetch"));
        when(mockUseCases.getProductDetails(productId))
            .thenAnswer((_) async => result);
        return viewModel;
      },
      act: (bloc) => bloc.getProductDetails(productId),
      expect: () => [
        isA<LoadingProductDetailsState>(),
        isA<ErrorProductDetailsState>(),
      ],
    );
  });
}
