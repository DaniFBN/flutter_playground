import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/auth/domain/entities/logout_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/exceptions.dart';

abstract class ILogoutEmailRepository {
  Future<Either<AuthException, LogoutEmailEntity>> logout();
}
