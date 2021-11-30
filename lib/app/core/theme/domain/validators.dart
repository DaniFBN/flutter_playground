import 'types.dart';

bool validateTheme(AppTheme theme) {
  const validThemes = AppTheme.values;

  return validThemes.contains(theme);
}
