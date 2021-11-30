import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';

abstract class IGetTokensDatasource {
  Future<GetTokensEntity> getTokens();
}
