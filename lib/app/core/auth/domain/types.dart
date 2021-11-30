import 'package:jwt_decode/jwt_decode.dart';

import 'exceptions.dart';

class LoginEmailPayload {
  final String email;
  final String password;

  LoginEmailPayload({required this.email, required this.password});
}

class SaveTokensPayload {
  final JwtToken access;
  final JwtToken refresh;

  SaveTokensPayload({required this.access, required this.refresh});
}

class JwtToken {
  final String token;
  late final DateTime expireAt;

  JwtToken({required this.token}) {
    final expireAt = Jwt.getExpiryDate(token);

    if (expireAt is DateTime) {
      this.expireAt = expireAt;
    } else {
      throw TokenValidationException('Invalid token');
    }
  }
}
