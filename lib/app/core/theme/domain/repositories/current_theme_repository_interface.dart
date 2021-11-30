import 'package:dartz/dartz.dart';

import '../entities/current_theme_entity.dart';
import '../exceptions.dart';

abstract class ICurrentThemeRepository {
  Future<Either<ThemeException, CurrentThemeEntity>> getTheme();
}
