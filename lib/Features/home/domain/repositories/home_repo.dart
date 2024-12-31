import '../entities/home_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class HomeRepo {
  Future<Result<HomeEntity>> getHomeData();
}
