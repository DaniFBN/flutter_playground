import 'dart:async';

import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/delete_tokens_usecase.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/get_tokens_usecase.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/login_email_usecase.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/logout_email_usecase.dart';
import 'package:flutter_training/app/core/auth/domain/usecases/save_tokens_usecase.dart';

import 'package:flutter_triple/flutter_triple.dart';

enum AuthState { idle, loggedIn, loggedOut }

class AuthStore extends NotifierStore<Exception, AuthState> {
  final ILoginEmailUsecase _loginEmailUsecase;
  final ILogoutEmailUsecase _logoutEmailUsecase;
  final ISaveTokensUsecase _saveTokensUsecase;
  final IGetTokensUsecase _getTokensUsecase;
  final IDeleteTokensUsecase _deleteTokensUsecase;

  AuthStore(
    this._loginEmailUsecase,
    this._logoutEmailUsecase,
    this._saveTokensUsecase,
    this._getTokensUsecase,
    this._deleteTokensUsecase,
  ) : super(AuthState.idle);

  bool get isLogged => state == AuthState.loggedIn;

  Future<void> loadState() async {
    setLoading(true);

    final tokens = await _getTokensUsecase();
    tokens.fold(
      (_) => update(AuthState.loggedOut),
      (_) => update(AuthState.loggedIn),
    );

    setLoading(false);
  }

  Future<void> loginWithEmail(String email, String password) async {
    setLoading(true);

    final payload = LoginEmailPayload(email: email, password: password);
    final tokens = await _loginEmailUsecase(payload);

    if (tokens.isRight()) {
      final response = await tokens.traverseFuture<bool>(_saveTokens);

      response.fold(
        (e) => setError(e),
        (r) {
          if (r) update(AuthState.loggedIn);
        },
      );
    }

    setLoading(false);
  }

  Future<void> logout() async {
    setLoading(true);

    final response = await _logoutEmailUsecase();
    response.fold(
      (e) => setError(e),
      (_) {
        unawaited(_deleteTokensUsecase());

        update(AuthState.loggedOut);
      },
    );

    setLoading(false);
  }

  Future<bool> _saveTokens(LoginEmailEntity entity) async {
    final payload = SaveTokensPayload(
      access: entity.accessToken,
      refresh: entity.refreshToken,
    );

    final response = await _saveTokensUsecase(payload);
    return response.fold(
      (_) => false,
      (_) => true,
    );
  }
}
