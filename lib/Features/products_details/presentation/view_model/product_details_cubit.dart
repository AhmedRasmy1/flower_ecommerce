import 'package:bloc/bloc.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../domain/use_cases/product_details_usecases.dart';
import 'product_details_state.dart';
import '../../../../core/common/api_result.dart';
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
