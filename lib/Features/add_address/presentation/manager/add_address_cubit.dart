import 'dart:developer';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';

import '../../domain/entities/add_address_entity.dart';
import '../../domain/use_cases/add_address_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/common/api_result.dart';
import '../../data/models/request/add_address_model.dart';

part 'add_address_state.dart';

@injectable
class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit(this._addAddressUseCase) : super(AddAddressInitial());
  final AddAddressUseCase _addAddressUseCase;

  static AddAddressCubit get(context) => BlocProvider.of(context);
  String address = 'Enter the add_address';

  String city = 'Cairo';
  String lat = '37';
  String long = "24";

  // void doIntent(AddAddressToAction intent) async {
  //   if (isClosed) return;
  //   switch (intent) {
  //     case DoAddAddressToAction():
  //       addAddress(intent.addAddressRequest);
  //   }
  // }

  void addAddress({
    required String city,
    required String phone,
    required String street,

  }) async {
    String username =
        "${CacheService.getData(key: CacheConstants.userFirstName)} "
        "${CacheService.getData(key: CacheConstants.userLastName)}";

    emit(LoadingAddAddressState());

    var result = await _addAddressUseCase.addAddress(
        city, phone, street, lat, long, username);

    switch (result) {
      case Success<AddAddressEntity?>():
        if (!isClosed) {
          log('Success');
          emit(SuccessAddAddressState(result.data));
        }

      case Fail<AddAddressEntity?>():
        if (isClosed) return;
        log(result.exception.toString());
        log('Fail');
        emit(ErrorAddAddressState(result.exception));
    }
  }

  Future<void> changeAddress(String newAddress) async {
    address = newAddress;
    emit(ChangeAddressState(address));
  }
}
