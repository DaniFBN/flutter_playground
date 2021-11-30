import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/services/local_storage/hive_local_storage_service.dart';

import 'auth/auth_module.dart';
import 'theme/theme_module.dart';

class CoreModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        ThemeModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HiveLocalStorageService(), export: true),
  ];
}
