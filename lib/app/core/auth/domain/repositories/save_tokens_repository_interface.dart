import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/save_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';

import '../types.dart';

abstract class ISaveTokensRepository {
  Future<Either<AuthException, SaveTokensEntity>> saveTokens(
    SaveTokensPayload payload,
  );
}
