import 'package:flutter_training/app/core/auth/ui/auth_store.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, int> {
  final AuthStore _authStore;

  HomeStore(this._authStore) : super(0);

  Future<void> logout() async {
    await _authStore.logout();
  }
}
