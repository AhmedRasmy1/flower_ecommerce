import '../../../domain/use_cases/delete_product_use_case.dart';
import '../../../../../core/common/api_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'delete_product_state.dart';

@injectable
class DeleteProductViewModel extends Cubit<DeleteProductState> {
  DeleteProductViewModel(this._deleteProductUseCase)
      : super(DeleteProductInitial());
  final DeleteProductUseCase _deleteProductUseCase;

  static DeleteProductViewModel of(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> deleteProduct(
    String productId,
  ) async {
    emit(DeleteProductLoading());
    final result = await _deleteProductUseCase.invoke(productId);
    switch (result) {
      case Success():
        {
          emit(DeleteProductSuccess());
        }

      case Fail():
        {
          emit(DeleteProductFailure(result.exception));
        }
    }
  }
}
