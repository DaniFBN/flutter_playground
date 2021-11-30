import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';

abstract class ILoginEmailRepository {
  Future<Either<AuthException, LoginEmailEntity>> loginWithEmail(
      LoginEmailPayload payload);
}
