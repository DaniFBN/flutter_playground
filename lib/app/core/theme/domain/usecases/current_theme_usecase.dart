import 'package:dartz/dartz.dart';
import 'package:flutter_training/app/core/theme/domain/entities/current_theme_entity.dart';
import 'package:flutter_training/app/core/theme/domain/exceptions.dart';
import 'package:flutter_training/app/core/theme/domain/repositories/current_theme_repository_interface.dart';

abstract class ICurrentThemeUsecase {
  Future<Either<ThemeException, CurrentThemeEntity>> call();
}

class CurrentThemeUsecase implements ICurrentThemeUsecase {
  final ICurrentThemeRepository _repository;

  CurrentThemeUsecase(this._repository);

  @override
  Future<Either<ThemeException, CurrentThemeEntity>> call() async {
    return await _repository.getTheme();
  }
}
