import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/use_cases/all_categories_usecase.dart';
import 'all_products_state.dart';

@injectable
class AllProductsViewModel extends Cubit<AllProductsState> {
  final ProductsUseCase _categoriesUseCase;
  List<ProductsEntities> allProducts = [];
   List<ProductsEntities> filteredProducts = [];

  AllProductsViewModel(this._categoriesUseCase) : super(InitialState());

  void doIntent(AllProductsToAction intent) async {
    switch (intent) {
      case GetAllProductsAction():
        _getAllProducts();
    }
  }

  void _getAllProducts() async {
    emit(LoadingAllProductsState());

    var result = await _categoriesUseCase.getAllProducts();

    switch (result) {
      case Success<AllProductsEntities?>():
        if (!isClosed) {
          allProducts = result.data?.products ?? [];
         // filteredProducts = allProducts;
          emit(SuccessAllProductsState(result.data));
        }
      case Fail<AllProductsEntities?>():
        // print(result.exception);
        emit(ErrorAllProductsState(result.exception));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts=[];
     // filteredProducts = allProducts; // Reset to full list when query is empty
    } else {
      filteredProducts = allProducts
          .where((product) => product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchAllProductsState(filteredProducts));
  }
}
