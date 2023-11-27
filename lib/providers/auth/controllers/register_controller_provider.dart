import 'package:atrueque/providers/auth/states/register_states.dart';
import 'package:atrueque/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(const RegisterStateInitial());

  final Ref ref;

  Future<void> register(String username, String email, String password) async {
    state = const RegisterStateLoading();

    try {
      // Obtén el repositorio de autenticación
      final authRepository = ref.read(authRepositoryProvider);

      final Object isError =
          await authRepository.register(username, email, password);

      state = const RegisterStateSuccess();

      if (isError == false) {
        // navigate to homepage
        // Navigator.of(context).pushReplacementNamed('/home');
        return;
      }
    } catch (error) {
      // Manejo de errores
      state = RegisterStateError('Error en el registro: $error');
    }
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  (ref) {
    return RegisterController(ref);
  },
);
