import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/theme/domain/entities/current_theme_entity.dart';

import 'package:flutter_training/app/core/theme/domain/exceptions.dart';
import 'package:flutter_training/app/core/theme/domain/repositories/current_theme_repository_interface.dart';
import 'package:flutter_training/app/core/theme/infra/datasources/current_theme_datasource_interface.dart';

class CurrentThemeRepositoryImpl implements ICurrentThemeRepository {
  final ICurrentThemeDatasource datasource;

  CurrentThemeRepositoryImpl(this.datasource);

  @override
  Future<Either<ThemeException, CurrentThemeEntity>> getTheme() async {
    try {
      final theme = await datasource.getTheme();
      return Right(theme);
    } on ThemeException {
      return Left(ThemeException('Error in datasource'));
    }
  }
}
