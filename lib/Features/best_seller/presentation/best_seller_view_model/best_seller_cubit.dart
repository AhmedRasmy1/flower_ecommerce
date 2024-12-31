import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../../domain/use_case/best_seller_use_case.dart';
import 'best_seller_state.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerState> {
  BestSellerUseCase bestSellerUseCase;
  BestSellerViewModel(this.bestSellerUseCase) : super(InitialState());

  Future<void> getBestSeller() async {
    emit(LoadingBestSellerState());

    var result = await bestSellerUseCase.invoke();

    switch (result) {
      case Success<List<BestSellerEntity>?>():
        emit(SuccessBestSellerState(result.data));
      case Fail<List<BestSellerEntity>?>():
        emit(ErrorBestSellerState(result.exception));
    }
  }
}
