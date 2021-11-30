import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/theme/app_theme_data.dart';

import 'core/theme/domain/types.dart';
import 'core/theme/ui/theme_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeStore>();

    return ValueListenableBuilder<AppTheme>(
      valueListenable: themeStore.selectState,
      builder: (_, appTheme, __) {
        return MaterialApp(
          title: 'Flutter Training',
          themeMode: appTheme.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemeData(appTheme).currentThemeData,
        ).modular();
      },
    );
  }
}
