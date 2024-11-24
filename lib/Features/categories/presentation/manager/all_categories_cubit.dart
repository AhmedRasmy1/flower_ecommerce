import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/api_result.dart';
import '../../domain/entities/categories_entities.dart';
import '../../domain/use_cases/all_categories_usecase.dart';
import 'all_categories_state.dart';

@injectable
class AllCategoriesViewModel extends Cubit<AllCategoriesState> {
  final CategoriesUseCase _categoriesUseCase;

  AllCategoriesViewModel(this._categoriesUseCase) : super(InitialState());

  void doIntent(AllCategoriesToAction intent) async {
    switch (intent) {
      case GetAllCategoriesAction():
        _getAllCategories();
    }
  }

  void _getAllCategories() async {
    emit(LoadingAllCategoriesState());

    var result = await _categoriesUseCase.getAllCategories();

    switch (result) {
      case Success<AllCategoriesEntities?>():
        if (!isClosed) {
          emit(SuccessAllCategoriesState(result.data));
        }

      case Fail<AllCategoriesEntities?>():
        log(result.exception.toString());
        emit(ErrorAllCategoriesState(result.exception));
    }
  }
}
