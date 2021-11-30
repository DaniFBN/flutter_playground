import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/login_email_datasource_interface.dart';

class LoginEmailDatasourceImpl implements ILoginEmailDatasource {
  @override
  Future<LoginEmailEntity> login(LoginEmailPayload payload) async {
    await Future.delayed(const Duration(seconds: 2));

    if (payload.email != 'dev@dev.com' || payload.password != '12345678') {
      throw AuthException('Error in datasource');
    }

    final accessToken = JwtToken(token: _defaultToken);
    final refreshToken = JwtToken(token: _defaultToken);

    return LoginEmailEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

const _defaultToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiRGVmYXVsdCIsIklzc3VlciI6Iklzc3VlciIsIlVzZXJuYW1lIjoiRGVmYXVsdCIsImV4cCI6MTc2NDQ2NTg0NSwiaWF0IjoxNjM4MjM1NDQ1fQ.n9sxZuIA-FLqtDH4tfBaCElM8ASXymGlfhihrq1Syaw';
