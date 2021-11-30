import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/logout_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/logout_email_repository_interface.dart';

abstract class ILogoutEmailUsecase {
  Future<Either<AuthException, LogoutEmailEntity>> call();
}

class LogoutEmailUsecase implements ILogoutEmailUsecase {
  final ILogoutEmailRepository _repository;

  LogoutEmailUsecase(this._repository);

  @override
  Future<Either<AuthException, LogoutEmailEntity>> call() async {
    return await _repository.logout();
  }
}
