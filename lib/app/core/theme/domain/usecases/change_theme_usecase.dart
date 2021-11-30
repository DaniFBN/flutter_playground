import 'package:dartz/dartz.dart';

import '../entities/change_theme_entity.dart';
import '../exceptions.dart';
import '../repositories/change_theme_repository_interface.dart';
import '../types.dart';
import '../validators.dart';

abstract class IChangeThemeUsecase {
  Future<Either<ThemeException, ChangeThemeEntity>> call(
      ChangeThemePayload payload);
}

class ChangeThemeUsecase implements IChangeThemeUsecase {
  final IChangeThemeRepository _repository;

  ChangeThemeUsecase(this._repository);

  @override
  Future<Either<ThemeException, ChangeThemeEntity>> call(
      ChangeThemePayload payload) async {
    if (!validateTheme(payload.theme)) {
      return Left(ThemeException('Invalid Theme'));
    }

    return await _repository.changeTheme(payload);
  }
}
