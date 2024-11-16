import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/LoginResponseDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../models/request/RegisterModelDto.dart';

abstract class AuthOnLineDataSource {
  Future<Result<RegisterEntities?>> register(RegisterModelDto registerModelDto);

  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto);
}
