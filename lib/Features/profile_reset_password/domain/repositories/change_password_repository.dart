import 'package:flower_ecommerce/Features/profile_reset_password/domain/entities/change_password_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class ChangePasswordRepository
{

  Future<Result<ChangePasswordEntity?>>changePassword (String oldPassword,String newPassword,String rePassword,String token);



}