import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/Features/home/domain/repositories/home_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  final HomeRepo homeRepo;
  HomeUseCase(this.homeRepo);
  Future<Result<HomeEntity>> getHomeData() {
    return homeRepo.getHomeData();
  }
}
