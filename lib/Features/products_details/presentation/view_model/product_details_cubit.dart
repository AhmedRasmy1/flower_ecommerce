import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/Features/products_details/domain/use_cases/product_details_usecases.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/view_model/product_details_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsState> {
  final ProductDetailsUseCases productDetailsUseCases;

  ProductDetailsViewModel(this.productDetailsUseCases) : super(InitialState());

  Future<void> getProductDetails(String productId) async {
    emit(LoadingProductDetailsState());

    var result = await productDetailsUseCases.getProductDetails(productId);

    switch (result) {
      case Success<ProductDetailsEntity>():
        emit(SuccessProductDetailsState(result.data));
      case Fail<ProductDetailsEntity>():
        emit(ErrorProductDetailsState(result.exception));
    }
  }
}
