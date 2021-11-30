import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/logout_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/logout_email_repository_interface.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/logout_email_datasource_interface.dart';

class LogoutEmailRepositoryImpl implements ILogoutEmailRepository {
  final ILogoutEmailDatasource datasource;

  LogoutEmailRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LogoutEmailEntity>> logout() async {
    try {
      final entity = await datasource.logout();
      return Right(entity);
    } on AuthException {
      return Left(AuthException('Erro no logout'));
    }
  }
}
