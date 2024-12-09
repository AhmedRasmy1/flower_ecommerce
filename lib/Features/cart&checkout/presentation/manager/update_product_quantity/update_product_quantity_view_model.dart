import '../../../data/models/request/update_quantity_request.dart';
import '../../../domain/use_cases/update_product_quantity_use_case.dart';
import '../../../../../core/common/api_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'update_product_quantity_state.dart';

@injectable
class UpdateProductQuantityViewModel extends Cubit<UpdateProductQuantityState> {
  final UpdateProductQuantityUseCase _updateProductQuantiyUseCase;
  UpdateProductQuantityViewModel(this._updateProductQuantiyUseCase)
      : super(UpdateProductQuantityViewModelInitial());

  static UpdateProductQuantityViewModel of(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> updateProductQuantity({
    required UpdateQuantityRequest updateQuantityRequest,
    required String productId,
  }) async {
    emit(UpdateProductQuantityLoading());
    final result = await _updateProductQuantiyUseCase.invoke(
      updateQuantityRequest: updateQuantityRequest,
      productId: productId,
    );
    switch (result) {
      case Success():
        {
          emit(UpdateProductQuantitySuccess());
        }

      case Fail():
        {
          emit(UpdateProductQuantityFailure(result.exception));
        }
    }
  }
}
