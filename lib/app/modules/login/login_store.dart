import 'package:flutter_training/app/core/auth/ui/auth_store.dart';
import 'package:flutter_triple/flutter_triple.dart';

enum LoginState { idle, success, failure }

class LoginStore extends NotifierStore<Exception, LoginState> {
  final AuthStore _authStore;

  LoginStore(this._authStore) : super(LoginState.idle);

  Future<void> loginWithEmail(String email, String password) async {
    try {
      setLoading(true);
      await _authStore.loginWithEmail(email, password);

      update(LoginState.success);
    } on Exception {
      update(LoginState.failure);
    } finally {
      setLoading(false);
    }
  }
}
