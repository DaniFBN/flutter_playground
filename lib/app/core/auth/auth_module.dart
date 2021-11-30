import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/save_tokens_usecase.dart';
import 'package:flutter_training/app/core/auth/external/local_storage/save_tokens_datasource_impl.dart';
import 'package:flutter_training/app/core/auth/infra/repositories/save_tokens_repository_impl.dart';

import 'domain/usecases/delete_tokens_usecase.dart';
import 'domain/usecases/get_tokens_usecase.dart';
import 'domain/usecases/login_email_usecase.dart';
import 'domain/usecases/logout_email_usecase.dart';
import 'external/api/login_email_datasouce_impl.dart';
import 'external/api/logout_email_datasource_impl.dart';
import 'external/local_storage/delete_tokens_datasource_impl.dart';
import 'external/local_storage/get_tokens_datasource_impl.dart';
import 'infra/repositories/delete_tokens_repository_impl.dart';
import 'infra/repositories/get_tokens_repository_impl.dart';
import 'infra/repositories/login_email_repository_impl.dart';
import 'infra/repositories/logout_email_repository_impl.dart';
import 'ui/auth_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // LoginWithEmail
    Bind.singleton((i) => LoginEmailDatasourceImpl(), export: true),
    Bind.singleton((i) => LoginEmailRepositoryImpl(i()), export: true),
    Bind.singleton((i) => LoginEmailUsecase(i()), export: true),

    // LogoutWithEmail
    Bind.singleton((i) => LogoutEmailDatasourceImpl(), export: true),
    Bind.singleton((i) => LogoutEmailRepositoryImpl(i()), export: true),
    Bind.singleton((i) => LogoutEmailUsecase(i()), export: true),

    // SaveToken
    Bind.singleton((i) => SaveTokensDatasourceImpl(i()), export: true),
    Bind.singleton((i) => SaveTokensRepositoryImpl(i()), export: true),
    Bind.singleton((i) => SaveTokensUsecase(i()), export: true),

    // GetTokens
    Bind.singleton((i) => GetTokensDatasourceImpl(i()), export: true),
    Bind.singleton((i) => GetTokensRepositoryImpl(i()), export: true),
    Bind.singleton((i) => GetTokensUsecase(i()), export: true),

    // DeleteTokens
    Bind.singleton((i) => DeleteTokensDatasourceImpl(i()), export: true),
    Bind.singleton((i) => DeleteTokensRepositoryImpl(i()), export: true),
    Bind.singleton((i) => DeleteTokensUsecase(i()), export: true),

    // Store
    Bind.singleton((i) => AuthStore(i(), i(), i(), i(), i()), export: true)
  ];
}
