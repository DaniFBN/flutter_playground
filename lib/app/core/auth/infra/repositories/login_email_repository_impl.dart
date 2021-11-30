import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/login_email_repository_interface.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/login_email_datasource_interface.dart';

class LoginEmailRepositoryImpl implements ILoginEmailRepository {
  final ILoginEmailDatasource datasource;

  LoginEmailRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LoginEmailEntity>> loginWithEmail(
      LoginEmailPayload payload) async {
    try {
      final entity = await datasource.login(payload);
      return Right(entity);
    } on AuthValidationException {
      return Left(AuthValidationException('Erro na validação dos campos'));
    } on AuthException {
      return Left(AuthException('Erro na autenticação'));
    }
  }
}
