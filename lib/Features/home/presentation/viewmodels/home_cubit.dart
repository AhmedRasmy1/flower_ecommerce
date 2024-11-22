import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/Features/home/domain/use_cases/home_use_case.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;
  HomeCubit(this._homeUseCase) : super(HomeInitial());
  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await _homeUseCase.getHomeData();
    log('HomeCubit: getHomeData: $result');
    switch (result) {
      case Success<HomeEntity>():
        {
          emit(HomeSuccess(result.data));
          log('HomeCubit: getHomeData: ${result.data}');
        }

      case Fail<HomeEntity>():
        {
          emit(HomeFail(result.exception));
          log('HomeCubit: getHomeData: ${result.exception}');
        }
    }
  }
}
