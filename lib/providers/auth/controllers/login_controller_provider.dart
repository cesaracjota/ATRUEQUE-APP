import 'package:atrueque/providers/auth/states/login_states.dart';
import 'package:atrueque/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  Future<void> login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      final Object isError =
          await ref.read(authRepositoryProvider).login(email, password);
      state = const LoginStateSuccess();

      if (isError == false) {
        print("Wellcome");
      }
    } catch (error) {
      state = LoginStateError(error.toString());
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) {
    return LoginController(ref);
  },
);
