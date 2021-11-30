import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_training/app/core/theme/domain/usecases/change_theme_usecase.dart';

import 'package:flutter_training/app/core/theme/domain/usecases/current_theme_usecase.dart';
import 'package:flutter_training/app/core/theme/external/local_storage/change_theme_datasource_impl.dart';
import 'package:flutter_training/app/core/theme/external/local_storage/current_theme_datasource_impl.dart';
import 'package:flutter_training/app/core/theme/infra/repositories/change_theme_repository_impl.dart';
import 'package:flutter_training/app/core/theme/infra/repositories/current_theme_repository_impl.dart';
import 'package:flutter_training/app/core/theme/ui/theme_store.dart';

class ThemeModule extends Module {
  @override
  final List<Bind> binds = [
    // ChangeThemeUsecase
    Bind.singleton((i) => ChangeThemeDatasourceImpl(i()), export: true),
    Bind.singleton((i) => ChangeThemeRepositoryImpl(i()), export: true),
    Bind.singleton((i) => ChangeThemeUsecase(i()), export: true),

    // CurrentThemeUsecase
    Bind.singleton((i) => CurrentThemeDatasourceImpl(i()), export: true),
    Bind.singleton((i) => CurrentThemeRepositoryImpl(i()), export: true),
    Bind.singleton((i) => CurrentThemeUsecase(i()), export: true),

    // Store
    Bind.singleton((i) => ThemeStore(i(), i()), export: true)
  ];
}
