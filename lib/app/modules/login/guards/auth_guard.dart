import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/core/auth/ui/auth_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<AuthStore>().isLogged;
  }
}
