import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce/Features/products/domain/entities/products_entities.dart';
import 'package:flower_ecommerce/Features/products/domain/use_cases/all_categories_usecase.dart';
import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_cubit.dart';
import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'allproduct_cubit_test.mocks.dart';

@GenerateMocks([ProductsUseCase])
void main() {
  group('AllProductsViewModel Tests', () {
    late MockProductsUseCase mockProductsUseCase;
    late AllProductsViewModel productsViewModel;

    setUp(() {
      mockProductsUseCase = MockProductsUseCase();
      productsViewModel = AllProductsViewModel(mockProductsUseCase);
    });

    blocTest<AllProductsViewModel, AllProductsState>(
      'when calling getAllProducts, it should fetch products and emit success state',
      build: () {
        var mockData = AllProductsEntities();
        var result = Success<AllProductsEntities?>(mockData);

        when(mockProductsUseCase.getAllProducts())
            .thenAnswer((_) async => result);

        return productsViewModel;
      },
      act: (viewModel) {
        viewModel.doIntent(GetAllProductsAction());
      },
      expect: () => [
        isA<LoadingAllProductsState>(),
        isA<SuccessAllProductsState>(),
      ],
    );

    blocTest<AllProductsViewModel, AllProductsState>(
      'when calling getAllProducts, it should handle failure and emit error state',
      build: () {
        var result =
            Fail<AllProductsEntities?>(Exception("Some error occurred"));

        when(mockProductsUseCase.getAllProducts())
            .thenAnswer((_) async => result);

        return productsViewModel;
      },
      act: (viewModel) {
        viewModel.doIntent(GetAllProductsAction());
      },
      expect: () => [
        isA<LoadingAllProductsState>(),
        isA<ErrorAllProductsState>(),
      ],
    );
  });
}
