import 'package:flutter_training/app/core/auth/domain/types.dart';

class LoginEmailEntity {
  final JwtToken accessToken;
  final JwtToken refreshToken;

  LoginEmailEntity({required this.accessToken, required this.refreshToken});
}
