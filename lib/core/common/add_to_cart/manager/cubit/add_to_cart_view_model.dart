import '../../data/models/request/add_to_cart_req_body.dart';
import '../../domain/add_to_cart_use_case.dart';
import '../../../api_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'add_to_cart_state.dart';

@injectable
class AddToCartViewModel extends Cubit<AddToCartState> {
  AddToCartViewModel(this._addToCartUseCase) : super(AddToCartInitial());
  final AddToCartUseCase _addToCartUseCase;
  static AddToCartViewModel of(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> addProductToCart(AddToCartReqBody addToCartBody) async {
    emit(AddToCartLoading());
    final result = await _addToCartUseCase.invoke(addToCartBody);
    switch (result) {
      case Success():
        {
          emit(AddToCartSuccess());
        }

      case Fail():
        {
          emit(AddToCartFailure(result.exception));
        }
    }
  }
}
