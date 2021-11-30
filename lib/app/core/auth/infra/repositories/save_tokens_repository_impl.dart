import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/save_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/save_tokens_repository_interface.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/save_tokens_datasource_interface.dart';

class SaveTokensRepositoryImpl extends ISaveTokensRepository {
  final ISaveTokensDatasource datasource;

  SaveTokensRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, SaveTokensEntity>> saveTokens(
    SaveTokensPayload payload,
  ) async {
    try {
      final entity = await datasource.saveToken(payload);
      return Right(entity);
    } on AuthException {
      return Left(AuthException('Erro no datasource'));
    }
  }
}
