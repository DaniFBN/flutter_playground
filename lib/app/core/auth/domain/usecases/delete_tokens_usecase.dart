import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/delete_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/repositories/delete_tokens_repository_interface.dart';

abstract class IDeleteTokensUsecase {
  Future<Either<AuthException, DeleteTokensEntity>> call();
}

class DeleteTokensUsecase implements IDeleteTokensUsecase {
  final IDeleteTokensRepository repository;

  DeleteTokensUsecase(this.repository);

  @override
  Future<Either<AuthException, DeleteTokensEntity>> call() async {
    return await repository.deleteTokens();
  }
}
