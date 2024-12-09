import 'dart:developer';
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

  // void doIntent(AddAddressToAction intent) async {
  //   if (isClosed) return;
  //   switch (intent) {
  //     case DoAddAddressToAction():
  //       addAddress(intent.addAddressRequest);
  //   }
  // }

  void addAddress(String city, String phone, String street) async {
    emit(LoadingAddAddressState());

    var result = await _addAddressUseCase.addAddress(city, phone, street);

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
