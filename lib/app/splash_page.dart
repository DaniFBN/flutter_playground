import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/services/local_storage/hive_local_storage_service.dart';

import 'core/auth/ui/auth_store.dart';
import 'core/theme/ui/theme_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Future<void> didChangeDependencies() async {
    await Modular.get<HiveLocalStorageService>().load();
    await Modular.get<AuthStore>().loadState();
    await Modular.get<ThemeStore>().loadState();

    unawaited(Modular.to.pushReplacementNamed('/home/'));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: const Center(
          child: Text('SPLASH PAGE'),
        ),
      ),
    );
  }
}
