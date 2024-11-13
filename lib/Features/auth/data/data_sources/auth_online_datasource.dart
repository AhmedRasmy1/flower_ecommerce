import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../models/request/RegisterModelDto.dart';

abstract class AuthOnLineDataSource {
  Future<Result<RegisterEntities?>> register(RegisterModelDto registerModelDto);
}
