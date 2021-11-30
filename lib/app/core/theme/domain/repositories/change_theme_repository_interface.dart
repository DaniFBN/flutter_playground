import 'package:dartz/dartz.dart';

import '../entities/change_theme_entity.dart';
import '../exceptions.dart';
import '../types.dart';

abstract class IChangeThemeRepository {
  Future<Either<ThemeException, ChangeThemeEntity>> changeTheme(
    ChangeThemePayload payload,
  );
}
