import 'package:atrueque/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<Object> login(String email, String password) async {
    return _authService.login(email, password);
  }
  Future<Object> register(String username, String email, String password) async {
    return _authService.regiter(username, email, password);
  }

  bool isAuthenticated() {
    return true;
  }

}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authServiceProvider));
});