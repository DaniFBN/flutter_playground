import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/delete_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';

abstract class IDeleteTokensRepository {
  Future<Either<AuthException, DeleteTokensEntity>> deleteTokens();
}
