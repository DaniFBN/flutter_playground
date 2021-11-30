import 'package:flutter_training/app/core/theme/domain/entities/current_theme_entity.dart';

abstract class ICurrentThemeDatasource {
  Future<CurrentThemeEntity> getTheme();
}
