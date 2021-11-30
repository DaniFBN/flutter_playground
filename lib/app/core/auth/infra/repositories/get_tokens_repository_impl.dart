import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/get_tokens_repository_interface.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/get_tokens_datasource_interface.dart';

class GetTokensRepositoryImpl implements IGetTokensRepository {
  final IGetTokensDatasource datasource;

  GetTokensRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, GetTokensEntity>> getTokens() async {
    try {
      final entity = await datasource.getTokens();
      return Right(entity);
    } on AuthException {
      return Left(AuthException('Erro no datasource'));
    }
  }
}
