import 'package:flutter_training/app/core/auth/domain/entities/logout_email_entity.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/logout_email_datasource_interface.dart';

class LogoutEmailDatasourceImpl implements ILogoutEmailDatasource {
  @override
  Future<LogoutEmailEntity> logout() async {
    await Future.delayed(const Duration(seconds: 2));

    return LogoutEmailEntity();
  }
}
