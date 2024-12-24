import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/use_cases/all_categories_usecase.dart';
import 'all_products_state.dart';

@injectable
class AllProductsViewModel extends Cubit<AllProductsState> {
  final ProductsUseCase _categoriesUseCase;
  String? sortType;
static AllProductsViewModel get(context)=>BlocProvider.of(context);
  AllProductsViewModel(this._categoriesUseCase) : super(InitialState());

  // add a field to hold sort type



  // Handle different intents
  void doIntent(AllProductsToAction intent) async {
    switch (intent) {
      case GetAllProductsAction():

        getAllProducts(sortType);
    }
  }

  // Fetch all products, applying the sortType
  void getAllProducts(String? sortType) async {
    emit(LoadingAllProductsState()); // Emit loading state
print( 'getproduct${sortType}');
    var result = await _categoriesUseCase.getAllProducts(sortType ?? "");

    switch (result) {
      case Success<AllProductsEntities?>():
        if (!isClosed) {
          emit(SuccessAllProductsState(result.data)); // Emit success with data
        }
      case Fail<AllProductsEntities?>():
        emit(ErrorAllProductsState(result.exception)); // Emit error state
    }
  }
}

