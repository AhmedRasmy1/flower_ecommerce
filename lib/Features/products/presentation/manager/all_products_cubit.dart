import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../domain/entities/ProductsEntities.dart';
import '../../domain/use_cases/all_categories_usecase.dart';
import 'all_products_state.dart';

@injectable
class AllProductsViewModel extends Cubit<AllProductsState> {
  final ProductsUseCase _categoriesUseCase;

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
        // print(result.data!.products?[0].title);
        emit(SuccessAllProductsState(result.data));
      case Fail<AllProductsEntities?>():
        // print(result.exception);
        emit(ErrorAllProductsState(result.exception));
    }
  }
}
