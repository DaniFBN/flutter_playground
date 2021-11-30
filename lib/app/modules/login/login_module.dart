import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
