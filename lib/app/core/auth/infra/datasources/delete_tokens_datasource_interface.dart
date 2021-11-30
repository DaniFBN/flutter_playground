import 'package:flutter_training/app/core/auth/domain/entities/delete_tokens_entity.dart';

abstract class IDeleteTokensDatasource {
  Future<DeleteTokensEntity> deleteTokens();
}
