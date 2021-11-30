import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/save_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/save_tokens_repository_interface.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/domain/validators.dart';

abstract class ISaveTokensUsecase {
  Future<Either<AuthException, SaveTokensEntity>> call(
    SaveTokensPayload payload,
  );
}

class SaveTokensUsecase implements ISaveTokensUsecase {
  final ISaveTokensRepository _repository;

  SaveTokensUsecase(this._repository);

  @override
  Future<Either<AuthException, SaveTokensEntity>> call(
    SaveTokensPayload payload,
  ) async {
    if (!validateToken(payload.access) || !validateToken(payload.refresh)) {
      return Left(TokenValidationException('Formato de token inválido'));
    }

    return await _repository.saveTokens(payload);
  }
}
