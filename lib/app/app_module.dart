import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';

import 'modules/home/home_module.dart';
import 'modules/login/guards/auth_guard.dart';
import 'modules/login/login_module.dart';

import 'splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
  ];
}
