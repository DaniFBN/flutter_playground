import 'package:flutter_training/app/core/auth/domain/types.dart';

class GetTokensEntity {
  final JwtToken accessToken;
  final JwtToken refreshToken;

  GetTokensEntity({required this.accessToken, required this.refreshToken});
}
