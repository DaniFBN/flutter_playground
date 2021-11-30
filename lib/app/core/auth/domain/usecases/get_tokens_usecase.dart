import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/get_tokens_repository_interface.dart';

abstract class IGetTokensUsecase {
  Future<Either<AuthException, GetTokensEntity>> call();
}

class GetTokensUsecase implements IGetTokensUsecase {
  final IGetTokensRepository repository;

  GetTokensUsecase(this.repository);

  @override
  Future<Either<AuthException, GetTokensEntity>> call() async {
    return await repository.getTokens();
  }
}
