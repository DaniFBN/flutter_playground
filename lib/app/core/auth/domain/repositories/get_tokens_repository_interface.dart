import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';

abstract class IGetTokensRepository {
  Future<Either<AuthException, GetTokensEntity>> getTokens();
}
