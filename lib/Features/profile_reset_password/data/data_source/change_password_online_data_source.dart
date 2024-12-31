import '../../domain/entities/change_password_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class ChangePasswordOnlineDataSource {
  Future<Result<ChangePasswordEntity?>> changePassword(
      String oldPassword, String newPassword, String rePassword, String token);
}
