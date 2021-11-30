class ChangeThemePayload {
  final AppTheme theme;

  ChangeThemePayload({required this.theme});
}

enum AppTheme { light, dark }

extension AppThemeIsDark on AppTheme {
  bool get isDark {
    switch (this) {
      case AppTheme.light:
        return false;
      case AppTheme.dark:
        return true;
    }
  }
}
