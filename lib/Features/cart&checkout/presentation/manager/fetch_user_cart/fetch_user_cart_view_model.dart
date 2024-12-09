import '../../../domain/entities/cart_item_entity.dart';
import '../../../domain/use_cases/fetch_user_cart_usecase.dart';
import '../../../../../core/common/api_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'fetch_user_cart_view_state.dart';

@injectable
class FetchUserCartViewModel extends Cubit<FetchUserCartState> {
  final FetchUserCartUseCase _fetchUserCartUseCase;
  FetchUserCartViewModel(this._fetchUserCartUseCase)
      : super(FetchUserCartInitial());
  static FetchUserCartViewModel of(BuildContext context) =>
      BlocProvider.of(context);
  List<CartItemEntity>? _items;
  Future<void> fetchUserCart() async {
    emit(
      FetchUserCartLoading(isFirst: _items == null),
    );
    final result = await _fetchUserCartUseCase.invoke();
    switch (result) {
      case Success():
        {
          _items = result.data;
          emit(FetchUserCartSuccess(result.data));
        }

      case Fail():
        {
          emit(FetchUserCartFailure(result.exception));
        }
    }
  }
}
