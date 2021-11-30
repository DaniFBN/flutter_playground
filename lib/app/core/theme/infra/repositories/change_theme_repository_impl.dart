import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/theme/domain/entities/change_theme_entity.dart';

import 'package:flutter_training/app/core/theme/domain/exceptions.dart';
import 'package:flutter_training/app/core/theme/domain/repositories/change_theme_repository_interface.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';

import '../datasources/change_theme_datasource_interface.dart';

class ChangeThemeRepositoryImpl implements IChangeThemeRepository {
  final IChangeThemeDatasource datasource;

  ChangeThemeRepositoryImpl(this.datasource);

  @override
  Future<Either<ThemeException, ChangeThemeEntity>> changeTheme(
      ChangeThemePayload payload) async {
    try {
      final theme = await datasource.changeTheme(payload);
      return Right(theme);
    } on ThemeException {
      return Left(ThemeException('Invalid Theme'));
    }
  }
}
