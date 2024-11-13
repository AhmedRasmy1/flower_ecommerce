import 'package:flower_ecommerce/Features/auth/domain/entities/register_entities.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';

import '../data_sources/auth_online_datasource.dart';
import '../models/request/RegisterModelDto.dart';

@Injectable(as: AuthOnLineDataSource)
class AuthOnLineDataSourceImpl implements AuthOnLineDataSource {
  final ApiService _authRetrofit;

  AuthOnLineDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<RegisterEntities?>> register(
      RegisterModelDto registerModelDto) {
    return executeApi(() async {
      var response = await _authRetrofit.signUp(registerModelDto);
      return response.toRegisterEntities();
    });
  }
}
