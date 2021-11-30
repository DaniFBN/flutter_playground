import 'package:flutter/material.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';

abstract class IAppThemeData {
  ThemeData get currentThemeData;
}

class AppThemeData implements IAppThemeData {
  final AppTheme _theme;

  AppThemeData(this._theme);

  @override
  ThemeData get currentThemeData =>
      _theme.isDark ? ThemeData.dark() : ThemeData.light();
}
