import 'package:flutter_training/app/core/auth/domain/types.dart';

bool validateEmail(String value) {
  if (value.isEmpty || !value.contains('@') || !value.contains('.')) {
    return false;
  }
  return true;
}

bool validatePassword(String value) {
  if (value.isEmpty || value.length < 8) {
    return false;
  }
  return true;
}

bool validateToken(JwtToken value) {
  final splittedToken = value.token.split('.');
  if (splittedToken.length != 3 || value.expireAt.isBefore(DateTime.now())) {
    return false;
  }
  return true;
}
