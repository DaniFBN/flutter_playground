class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class AuthValidationException extends AuthException {
  AuthValidationException(String message) : super(message);
}

class TokenValidationException extends AuthException {
  TokenValidationException(String message) : super(message);
}

class NotAuthenticatedException extends AuthException {
  NotAuthenticatedException(String message) : super(message);
}
