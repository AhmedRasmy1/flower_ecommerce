import '../entities/home_entity.dart';
import '../repositories/home_repo.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  final HomeRepo homeRepo;
  HomeUseCase(this.homeRepo);
  Future<Result<HomeEntity>> getHomeData() {
    return homeRepo.getHomeData();
  }
}
