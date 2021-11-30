import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';
import 'package:flutter_training/app/core/theme/ui/theme_store.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final themeStore = Modular.get<ThemeStore>();

  Future<void> logout() async {
    await store.logout();

    unawaited(Modular.to.pushReplacementNamed('/login/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: logout, child: const Text('LOGOUT')),
          ValueListenableBuilder<AppTheme>(
            valueListenable: themeStore.selectState,
            builder: (_, appTheme, __) {
              return Switch(
                value: appTheme.isDark,
                onChanged: (darkMode) {
                  final themeState = darkMode ? AppTheme.dark : AppTheme.light;
                  themeStore.changeTheme(themeState);
                },
              );
            },
          ),

          // Switch(
          //   value: themeStore.isDarkTheme,
          //   onChanged: (darkMode) {
          //     final themeState = darkMode ? ThemeState.dark : ThemeState.light;
          //     themeStore.changeTheme(themeState);
          //   },
          // ),
        ],
      ),
    );
  }
}
