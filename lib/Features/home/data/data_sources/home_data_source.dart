import '../../domain/entities/home_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class HomeDataSource {
  Future<Result<HomeEntity>> getHomeData();
}
