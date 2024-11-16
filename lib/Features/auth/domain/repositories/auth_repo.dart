import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/LoginResponseDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';

import '../../../../core/common/api_result.dart';
import '../entities/register_entities.dart';


abstract class AuthRepo {

  Future<Result<RegisterEntities?>> register(

    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
    String gender,
  );

  Future<Result<LoginEntitie>> login (String name,String password);

}
