import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';

mixin TokenEntityMapper {
  static Map toJson(SaveTokensPayload entity) {
    final jsonData = {
      'access': entity.access.token,
      'refresh': entity.refresh.token,
    };

    return jsonData;
  }

  static GetTokensEntity fromJson(Map json) {
    if (!json.containsKey('access') || !json.containsKey('refresh')) {
      throw NotAuthenticatedException('Not authenticated');
    }

    return GetTokensEntity(
      accessToken: JwtToken(token: json['access']),
      refreshToken: JwtToken(token: json['refresh']),
    );
  }
}
