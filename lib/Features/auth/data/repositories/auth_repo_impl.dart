import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../data_sources/auth_online_datasource.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_offline_datasource.dart';
import '../models/request/RegisterModelDto.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(
    this.offLineDataSource,
    this.onLineDataSource,
  );


  @override
  Future<Result<RegisterEntities?>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String gender,
      String rePassword,
      String phone) {

    return onLineDataSource.register(RegisterModelDto(
      email: email,
      firstName: firstName,
      gender:gender,
      rePassword:rePassword,
      phone:phone,
      password: password,
      lastName: lastName,

    ));
  }
}
