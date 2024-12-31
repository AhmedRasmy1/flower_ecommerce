import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/common/api_result.dart';

import '../../../data/models/occasion_response/occasion_response.dart';
import '../../../domain/use_cases/occasion_use_case.dart';
import 'occasion_state.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionState> {
  OccasionUseCase occasionUseCase;

  OccasionViewModel(this.occasionUseCase) : super(InitialState());

  void getOccasions() async {
    emit(LoadingOccasionState());

    var result = await occasionUseCase.getOccasions();

    switch (result) {
      case Success<OccasionResponse?>():
        emit(SuccessOccasionState(result.data));
      case Fail<OccasionResponse?>():
        emit(ErrorOccasionState(result.exception));
    }
  }
}
