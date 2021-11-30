import 'package:flutter_training/app/core/auth/domain/entities/save_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';

abstract class ISaveTokensDatasource {
  Future<SaveTokensEntity> saveToken(SaveTokensPayload payload);
}
