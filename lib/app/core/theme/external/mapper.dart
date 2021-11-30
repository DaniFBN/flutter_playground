import 'package:flutter_training/app/core/theme/domain/entities/current_theme_entity.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';

mixin CurrentThemeEntityMapper {
  static CurrentThemeEntity fromJson(Map json) {
    var theme = 0;
    if (json['theme'] != null) theme = json['theme'] as int;

    return CurrentThemeEntity(theme: AppTheme.values[theme]);
  }
}
