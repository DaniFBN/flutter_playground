import 'package:flutter_training/app/core/theme/domain/types.dart';
import 'package:flutter_training/app/core/theme/domain/usecases/change_theme_usecase.dart';
import 'package:flutter_training/app/core/theme/domain/usecases/current_theme_usecase.dart';

import 'package:flutter_triple/flutter_triple.dart';

class ThemeStore extends NotifierStore<Exception, AppTheme> {
  final ChangeThemeUsecase _changeThemeUsecase;
  final CurrentThemeUsecase _currentThemeUsecase;

  ThemeStore(this._changeThemeUsecase, this._currentThemeUsecase)
      : super(AppTheme.light);

  Future<void> loadState() async {
    setLoading(true);

    final currentTheme = await _currentThemeUsecase();
    currentTheme.fold(
      (e) => _init(),
      (entity) => update(entity.theme),
    );

    setLoading(false);
  }

  Future<void> changeTheme(AppTheme value) async {
    setLoading(true);

    if (value == state) return;

    final newTheme =
        await _changeThemeUsecase(ChangeThemePayload(theme: value));

    newTheme.fold(
      (e) => null,
      (entity) => update(entity.theme),
    );

    setLoading(false);
  }

  Future<void> _init() async {
    final payload = ChangeThemePayload(theme: AppTheme.light);
    await _changeThemeUsecase(payload);
  }
}
