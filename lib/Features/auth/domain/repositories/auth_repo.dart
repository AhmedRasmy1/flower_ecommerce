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


}
