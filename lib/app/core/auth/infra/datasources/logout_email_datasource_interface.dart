import 'package:flutter_training/app/core/auth/domain/entities/logout_email_entity.dart';

abstract class ILogoutEmailDatasource {
  Future<LogoutEmailEntity> logout();
}
