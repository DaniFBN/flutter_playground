import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/login_email_repository_interface.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/domain/validators.dart';

abstract class ILoginEmailUsecase {
  Future<Either<AuthException, LoginEmailEntity>> call(
    LoginEmailPayload payload,
  );
}

class LoginEmailUsecase implements ILoginEmailUsecase {
  final ILoginEmailRepository _repository;

  LoginEmailUsecase(this._repository);

  @override
  Future<Either<AuthException, LoginEmailEntity>> call(
    LoginEmailPayload payload,
  ) async {
    if (!validateEmail(payload.email)) {
      return Left(AuthValidationException('Email inválido'));
    }
    if (!validatePassword(payload.password)) {
      return Left(AuthValidationException('Senha inválida'));
    }

    return await _repository.loginWithEmail(payload);
  }
}
