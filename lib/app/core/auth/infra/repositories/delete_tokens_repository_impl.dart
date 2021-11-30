import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/delete_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/delete_tokens_repository_interface.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/delete_tokens_datasource_interface.dart';

class DeleteTokensRepositoryImpl implements IDeleteTokensRepository {
  final IDeleteTokensDatasource datasource;

  DeleteTokensRepositoryImpl(this.datasource);
  @override
  Future<Either<AuthException, DeleteTokensEntity>> deleteTokens() async {
    try {
      final response = await datasource.deleteTokens();
      return Right(response);
    } on AuthException {
      return Left(AuthException('Erro no datasource'));
    }
  }
}
